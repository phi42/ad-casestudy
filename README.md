# ad-casestudy

Case study application of the [`ad-enforcement-tool`](https://github.com/phi42/ad-enforcement-tool).

This repository is a fork of [modular-monolith-with-ddd](https://github.com/kgrzybek/modular-monolith-with-ddd) (.NET 8 / Domain-Driven Design). The original README is preserved at [docs/ORIGINAL-README.md](docs/ORIGINAL-README.md).

## Rules

The case study shows how Architectural Decision Records (ADRs) can be enforced automatically by attaching rule files (`.rule`) to existing ADRs and running the [ad-enforcement-tool](https://github.com/phi42/ad-enforcement-tool) (`ade`) against them.

For each enforceable ADR in [docs/architecture-decision-log/](docs/architecture-decision-log/), there is a `*.rule` file written in the ADE rule DSL. The rules are evaluated by two plugins:

- [netarch](https://github.com/phi42/ad-plugin-netarchtest) compiles `code "..."` rules into [NetArchTest](https://github.com/BenMorris/NetArchTest) NUnit test files that run inside the `ArchTests` projects
- [fscheck](https://github.com/phi42/ad-plugin-fscheck) verifies `file "..."` rules (file existence, content matching, etc.) directly against the source tree

| ADR  | Rule file                                             | Subject                                            |
| ---- | ----------------------------------------------------- | -------------------------------------------------- |
| 0004 | [0004.rule](docs/architecture-decision-log/0004.rule) | Divide the system into modules                     |
| 0005 | [0005.rule](docs/architecture-decision-log/0005.rule) | Single REST API module                             |
| 0006 | [0006.rule](docs/architecture-decision-log/0006.rule) | Module facades between API and business modules    |
| 0009 | [0009.rule](docs/architecture-decision-log/0009.rule) | 2-layered architecture for reads (CQRS query side) |
| 0010 | [0010.rule](docs/architecture-decision-log/0010.rule) | Clean architecture for writes                      |
| 0014 | [0014.rule](docs/architecture-decision-log/0014.rule) | Event-driven communication between modules         |
| 0015 | [0015.rule](docs/architecture-decision-log/0015.rule) | In-memory event bus                                |
| 0016 | [0016.rule](docs/architecture-decision-log/0016.rule) | IoC container per module                           |
| 0017 | [0017.rule](docs/architecture-decision-log/0017.rule) | Architecture tests are present                     |

Configuration for `ade` lives in [.ade.yaml](.ade.yaml). It pins the default plugins (`netarch` for compile, `fscheck` for verify), points at the rule directory, and configures the netarch plugin to generate tests into [src/Tests/ArchTests/Generated/](src/Tests/ArchTests/Generated/). When `assembly-prefixes` is set, the plugin also generates an `AssemblyPreloader.g.cs` that force-loads matching module assemblies before tests run.

## Workflow

The toolchain runs in three phases:

1. `ade validate` parses the rule files and checks them against the DSL grammar
2. `ade compile` invokes the `netarch` plugin to generate NUnit/NetArchTest C# files from `code` rules
3. `ade verify` invokes the `fscheck` plugin to evaluate `file` rules

The generated tests are then executed by the regular .NET test runner alongside the existing architecture tests. Both the generated rule tests and the hand-written architecture tests live in the `ArchTests` projects.

## CI

[.github/workflows/buildPipeline.yml](.github/workflows/buildPipeline.yml) runs two jobs:

- `build-and-test` installs `ade` and the `netarch` plugin, runs `ade compile`, then builds and runs the unit and architecture tests
- `rule-check` installs `ade` and the `fscheck` plugin, runs `ade verify`

Both jobs install pinned released versions of `ade` and the plugins from GitHub.
