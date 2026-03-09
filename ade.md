# Architectural Decision Enforcement (ADE) Wiki

## Project

### Outline

Architectural decisions (ADs) typically go through the phases of *decision identification*, *decision making* and *decision enactment/enforcement*.

A key problem in modern software development is the phenomenon of architecture drift or design erosion. This occurs when architectural decisions are not consistently implemented (enforced) in the code base or regularly reviewed. Although tools for structural code analysis exist, there is currently no overarching concept that automatically converts documented architectural decisions (e.g. in ADR, MADR or text form) into verifiable rules.

The gap between decision documentation and technical enforcement means that rules have to be maintained manually. This process is resource-intensive, error-prone and difficult to reproduce. As system complexity increases, this raises the risk that original architectural decisions will gradually erode or be lost in everyday development.

The aim of this thesis is to develop a conceptual approach for the automated enforcement of architectural decisions in software projects.

### Specifications

To guide development, a set of functional requirements, quality attributes, and concrete use cases has been specified.

#### Use Cases

The tool targets technical users who work close to the code base. In small teams or solo settings, a developer often creates and applies rules. In larger contexts, an architect makes decisions and developers apply them during implementation. If a plugin is not available for a specific framework, a developer might also implements one himself. These roles don't have to be exclusive.

#### Requirements

- Parse a decision written in a DSL
- Validate semantic model (decision object) for correctness.
- Convert semantic model to defined IR (schema validation)
- Plugins can be implemented in any language and discovered at runtime.
- Plugins compile IR to enforcable decision rules.
- Link generated rules to the original decision (e.g., ADR).
- Rules and plugins should be extendable without breaking old set ups (versioning on DSL and IR).
- CI integration of tool for pipelines to automate the process.
- Simple syntax, user-friendly CLI commands.

## Research

Part of the thesis includes a systematic literature research on the topic of architectural drift and enforcement.

### Methodology

To find existing literature following sources and search tearms have been used:

Proceedings:

- [ICSA 2021-2025](https://www.computer.org/csdl/proceedings/1000680)

Open search with [specific terms](https://ieeexplore.ieee.org/search/searchresult.jsp?action=search&newsearch=true&matchBoolean=true&queryText=(%22All%20Metadata%22:software)%20OR%20(%22All%20Metadata%22:architectural)%20OR%20(%22All%20Metadata%22:architecture)%20OR%20(%22All%20Metadata%22:drift)%20OR%20(%22All%20Metadata%22:erosion)%20OR%20(%22All%20Metadata%22:decay)%20OR%20(%22All%20Metadata%22:enforcement)):

```misc
software | architectural | architecrure | drift | erosion | decay | enforcement | decision
```

- [IEEE Xplore](https://ieeexplore.ieee.org/Xplore/home.jsp)
- [Research Gate](https://www.researchgate.net/search)
- [Science Direct](https://www.sciencedirect.com)
- [Google Scholar](https://scholar.google.com)
- [Google](https://www.google.com)

### Findings

Decisions

- [A study of architectural decision practices](https://ieeexplore.ieee.org/document/6614735)
- [A Taxonomy for Design Decisions in Software Architecture Documentation](https://link.springer.com/chapter/10.1007/978-3-031-36889-9_29)
- [ADeX: A Tool for Automatic Curation of Design Decision Knowledge for Architectural Decision Recommendations](https://ieeexplore.ieee.org/document/8712348) (no pdf available)
- [Architectural design decisions](https://research.rug.nl/en/publications/architectural-design-decisions/) (pdf in separate parts)
- [Architectural Design Decisions in Open Software Development: A Transition to Software Ecosystems](https://ieeexplore.ieee.org/document/6824107)
- [Constraint-Based Consistency Checking between Design Decisions and Component Models for Supporting Software Architecture Evolution](https://ieeexplore.ieee.org/document/6178895)
- [Modeling and Documenting the Evolution of Architectural Design Decisions](https://ieeexplore.ieee.org/document/4273349)
- [Quality Metrics in Software Architecture](https://www.computer.org/csdl/proceedings-article/icsa/2023/974900a058/1MBRIOGm17q) (no pdf available)
- [Reusable Architectural Decision Models for Enterprise Application Development](https://link.springer.com/chapter/10.1007/978-3-540-77619-2_2)
- [Tool Support for Learning Architectural Guidance Models from Architectural Design Decision Models](https://dl.acm.org/doi/10.1145/3628034.3628037)
- [Towards a framework for managing architectural design decisions](https://dl.acm.org/doi/10.1145/3129790.3129799)
- [Using Architectural Patterns to Define Architectural Decisions](https://ieeexplore.ieee.org/document/6337718)
- [Using Patterns to Capture Architectural Decisions](https://ieeexplore.ieee.org/document/4267601)

Drift/Erosion/Decay

- [Architectural Decay as Predictor of Issue- and Change-Proneness](https://www.computer.org/csdl/proceedings-article/icsa/2021/626000a092/1twfmmJvjYk)
- [Architectural Degradation: Definition, Motivations, Measurement and Remediation Approaches](https://arxiv.org/pdf/2507.14547)
- [Characterizing the Architectural Erosion Metrics: A Systematic Mapping Study](https://ieeexplore.ieee.org/document/9709798)
- [Detecting Inconsistencies in Software Architecture Documentation Using Traceability Link Recovery](https://www.computer.org/csdl/proceedings-article/icsa/2023/974900a141/1MBRHJQFGjC)
- [Drift and Erosion in Software Architecture: Summary and Prevention Strategies](https://dl.acm.org/doi/abs/10.1145/3404663.3404665)
- [Forecasting Architectural Decay From Evolutionary History](https://ieeexplore.ieee.org/document/9357984)
- [Recovering Trace Links Between Software Documentation And Code](https://dl.acm.org/doi/10.1145/3597503.3639130)
- [Software Architecture Degradation in Open Source Software: A Systematic Literature Review](https://ieeexplore.ieee.org/document/9200327)
- [Symptoms of Architecture Erosion in Code Reviews: A Study of Two OpenStack Projects](https://www.computer.org/csdl/proceedings-article/icsa/2022/172800a024/1DDCsCQXXe8)
- [Understanding Architecture Erosion: The Practitioners’ Perceptive](https://ieeexplore.ieee.org/abstract/document/9463012)
- [Understanding software architecture erosion: A systematic mapping study](https://onlinelibrary.wiley.com/doi/abs/10.1002/smr.2423)
- [We're Drifting Apart: Architectural Drift from the Developers' Perspective](https://ieeexplore.ieee.org/document/10592790)

Enforcement:

- [A Unified Approach to Architecture Conformance Checking](https://scg.unibe.ch/archive/papers/Cara15b.pdf)
- [An Automated Approach to Check Software Architecture Erosion](https://homepages.cwi.nl/~jurgenv/theses/RuichenHu.pdf)
- [Architecture enforcement concerns and activities - An expert study](https://www.sciencedirect.com/science/article/abs/pii/S0164121218301614#:~:text=Architecture%20enforcement%20is%20concerned%20with%20the%20correct,decisions%20in%20order%20to%20ensure%20software%20quality.)
- [Automatic architectural enforcement](https://drops.dagstuhl.de/entities/document/10.4230/DagSemProc.08142.5)
- [Automatic enforcement of architectural design rules](https://ieeexplore.ieee.org/document/6062216)
- [Enforcing Architectural Security Decisions](https://ieeexplore.ieee.org/document/9101221) (no pdf available)
- [Mitigating Technical and Architectural Debt with Sonargraph](https://ieeexplore.ieee.org/document/8786002)
- [Why should architectural principles be enforced?](https://ieeexplore.ieee.org/abstract/document/798359)

Miscellanous:

- [A discipline of software architecture](https://ieeexplore.ieee.org/document/9486229)
- [An Integrated Approach to Package and Class Code- to-Architecture Mapping Using InMap](https://www.computer.org/csdl/proceedings-article/icsa/2023/974900a164/1MBRI0644WA) (no pdf available)
- [Architecture as Code](https://www.computer.org/csdl/proceedings-article/icsa/2025/209000a187/26kRnSWNVqU)
- Domain Specific Languages (Fowler)
- [InMap: Automated Interactive Code-to-Architecture Mapping Recommendations](https://www.computer.org/csdl/proceedings-article/icsa/2021/626000a173/1twfmO65MpW)
- [Software architecture: foundations, theory, and practice](https://ieeexplore.ieee.org/document/6062253) (no pdf available)
- [The Value of Architecture](https://www.hello2morrow.com/whitepapers)

## Architectural Drift and Erosion

"Software architecture is the set of structures needed to reason about a software system and the discipline of creating such structures and systems. Each structure comprises software elements, relations among them, and properties of both elements and relations." [Wikipedia](https://en.wikipedia.org/wiki/Software_architecture)

 "( . . . ) the heart of thinking architecturally about software is to decide what is important, (i.e. what is architectural), and then expend energy on keeping those architectural elements in good condition." [Fowler](https://martinfowler.com/architecture/)

"Applications that were initially well-architected can deteriorate due to various factors such as neglect, shifting priorities, developer turnover, release pressures, a lack of awareness of these changes and many other factors." [Multiplayer](https://www.multiplayer.app/blog/how-to-recover-your-architecture-after-drift-and-erosion/#:~:text=Architectural%20Drift%20is%20defined%20by,breach%20the%20core%20architectural%20principles.)

"Architectural drift involves the introduction of design decisions that were not part of the original architectural plan, yet these decisions do not necessarily contravene the foundational architecture. In contrast, architectural erosion occurs when new design considerations are introduced that directly conflict with or undermine the system's intended architecture, effectively violating its guiding principles." [DZone](https://dzone.com/articles/navigating-architectural-change-overcoming-drift)

One approach to combat architectural drift is to make use of observability to set up metrics proactively, which should detect and correct abnormal behaviours during runtime. [vFunction](https://vfunction.com/blog/how-continuous-modernization-can-address-architectural-drift/)

To mitigate architectural drift, one approach is to make use of code conformence checks like architecture tests, static and dynamic code analysis tools.

More source:

- [Software Quality Assurance, Chapter 10 — Ivan Mistrik, Richard M Soley, Nour Ali, John Grundy, Bedir Tekinerdogan (2015)](https://www.oreilly.com/library/view/software-quality-assurance/9780128025413/xhtml/chp010.xhtml) [(alternative)](https://www.sciencedirect.com/science/chapter/edited-volume/abs/pii/B9780128023013000107)

## Architectural Enforcement

"An architect needs to ensure the correct implementation of design decisions during software development life cycle (i.e. during development and maintenance phases)." [ScienceDirect](https://www.sciencedirect.com/science/article/abs/pii/S0164121218301614)

"Architecture enforcement is concerned with the correct and seamless implementation of architecture design decisions in order to ensure software quality." [ScienceDirect](https://www.sciencedirect.com/science/article/abs/pii/S0164121218301614)

"Architects evaluate the severity of architectural violations rather intuitively. As we can imply from the results of our survey, architects often use metrics for example on static package dependencies in order to find hot spots that could give hints for crucial architectural violations. We suggest that a better guidance is needed for software architects in order to evaluate architecture violations and their severity." [ScienceDirect](https://www.sciencedirect.com/science/article/abs/pii/S0164121218301614)

"Architecture tests are automated tests that are designed to validate and enforce the architectural design patterns within your codebase. In the same way unit tests automate the manual testing of business logic, architecture tests automate the manual code reviews that would be needed to enforce these design patterns and conventions. And, obviously, do it in a more consistent and less error-prone way." [mikevanoo](https://mikevanoo.co.uk/blog/architectural-unit-tests/)

Architecture tests are particularly useful to enforce software architecture rules in a layered architecture or Modular Monolith. For example, to express that the domain layer should not have any dependencies (as is defined with Clean Architecture), you can write a test for enforcing this rule: [milanjovanovic](https://www.milanjovanovic.tech/blog/enforcing-software-architecture-with-architecture-tests)

```C#
var result = Types
  .InAssembly(DomainAssembly)
  .ShouldNot()
  .HaveDependencyOnAny("Application", "Infrastructure")
  .GetResult();

Assert.True(result.IsSuccessful);
```

"Software Architecture does not only concern itself with simple maintainability rules. ( . . . ) You typically design your architecture with select architectural drivers in mind. Architectural Unit tests are fitness functions that enforce architectural requirements from within your codebase." Some other fitness function ideas can be static code analysis tools, software package metrics, and automatated penetration testing. [Medium](https://ryansusana.medium.com/testing-your-software-architecture-cf3c17be00b)

More sources:

- [Ultimate Architecture Enforcement: Prevent Code Violations at Code-Commit Time](https://www.sei.cmu.edu/blog/ultimate-architecture-enforcement-prevent-code-violations-at-code-commit-time/)
- [Using AI Agents to Enforce Architectural Standards](https://medium.com/@dave-patten/using-ai-agents-to-enforce-architectural-standards-41d58af235a0)

### Automated Conformance Checking Tools

Tools to enforce rule can be automated with pipeline builds (CI/CD) or commit hooks. Architecture Tests are the most relevant for checking architectural violatons, while the others are not primarly focused on it.

Architecture Tests

- [ArchUnit (Java)](https://github.com/TNG/ArchUnit)
- [ArchUnitNET](https://github.com/TNG/ArchUnitNET)
- [NetArchTest](https://github.com/BenMorris/NetArchTest)
- [go-arch](https://github.com/arch-go/arch-go)
- [ArchUnit Go](https://github.com/kcmvp/archunit)
- [ArchUnitTS](https://github.com/LukasNiessen/ArchUnitTS)
- [ts-arch](https://github.com/ts-arch/ts-arch)
- [Konsist](https://github.com/LemonAppDev/konsist)
- [pytestarch](https://github.com/zyskarch/pytestarch)

Static Analysis Tools

- SonarQube
- ESLint
- Pylint
- [golangci-lint](https://github.com/golangci/golangci-lint)

Dynamic Analysis (Observability)

- Prometheus
- Grafana
- Jaeger

## Software Design

```cascii.app
┌───────────────┐               ┌───────────────────┐              ┌───────────┐
│     Input     │               │Parser + Validation│              │ Compiler  │
│(ADG, raw file)│───── DSL ────►│ (AD-Enforcement)  ├───── IR ────►│ (Plugins) │
└───────────────┘               └───────────────────┘              └───────────┘
```

The entire workflow can be divided into three parts.

1. **Input:** This is the source of the architectural rule. This could be created by the ADG tool or directly written in a file. The input needs to be written in the Domain Specific Language (DSL).
2. **Parser + Validation:** This is the AD-Enforcement tool. This tool parses the DSL to a semantic model (domain object) and performs validation to check if the model is correct. Then it transforms the object to an Intermediate Representation (IR) to send to a plugin.
3. **Compiler:** A plugin receives the IR of the rule(s) and compiles them to a specific enforcement check. A plugin could for example compile the rule to an architecture tests for a specific framework in a specific language (e.g. ArchUnit for C#).

With this, the specific implementation of the different frameworks are abstraced over one DSL, and this pipeline is able to convert a DSL to any specific implementation provided a plugin exists for it.

### AD-Enforcement Tool

The AD-Enforcement tool is written in Go and follows a simple onion architecture consisting of three layers:

| Package       | Description                                                                               |
| ------------- | ----------------------------------------------------------------------------------------- |
| `domain`      | Core domain objects and function like the architectural rule and handling of plugin data. |
| `application` | Main use cases of the tool, like parsing an input file to a domain object.                |
| `cmd`         | Entry points of the tool, these represent the commands of the CLI.                        |

The tool needs to create an Abstract Syntax Tree (AST) by parsing the DSL, then creates a semantic model, validates it, and then converts it to an IR for the plugin.

### Plugins

The Plugins can be implemented in any language and for any framework. The only requirements are that the plugin is available as a binary/process (e.g. executable file on Window) so that the ADE tool can start the process after parsing and validating the architectural rules. The plugin receives the IR of the rule and can then use this to create enforcable check.

## Domain Specific Language

A Domain-Specific Language (DSL) is a computer language that's targeted to a particular kind of problem, rather than a general purpose language that's aimed at any kind of software problem. ( . . . ) Internal DSLs are particular ways of using a host language to give the host language the feel of a particular language. ( . . . ) External DSLs have their own custom syntax and you write a full parser to process them. There is a strong tradition of doing this in the Unix community. A variation of this is to encode the DSL in a data structure representation such as XML or YAML." [Fowler 1](https://martinfowler.com/dsl.html)

"People find DSLs valuable because a well-designed DSL can be much easier to program with than a traditional library. This improves programmer productivity, which is always valuable. In particular it may also improve communication with domain experts, which is an important tool for tackling one of the hardest problems in software development." [Fowler 2](https://martinfowler.com/books/dsl.html)

Developing a custom DSL can also be beneficial for simplified problem solving, increased productivity, improved readabililty, automation, and code generation. [Medium](https://medium.com/@robertdennyson/building-your-own-custom-dsl-a-comprehensive-guide-9be7bb70524d)

In the case of Architectural Enforcement we are particular interested in providing a way to a) improve readabililty for domain experts, b) generate architecture tests (enforcable rules), and c) do this in an automated fashion.

"The first and most crucial step in building a custom DSL is to understand the problem domain thoroughly." [Medium](https://medium.com/@robertdennyson/building-your-own-custom-dsl-a-comprehensive-guide-9be7bb70524d)

"A domain-specific language must have a reasonably small set of elements that can be easily defined and extended to represent domain-specific constructs. A notation consists of shapes, which represent the elements, and connectors, which represent the relationships between elements." [Microsoft](https://learn.microsoft.com/en-us/visualstudio/modeling/about-domain-specific-languages?view=vs-2022)

"Designing a DSL involves determining how users will interact with the language, what constructs are available, and what semantics each construct will follow. ( . . . ) [An external] DSL has its own distinct syntax, separate from any general-purpose language. You’ll need to define how this DSL is interpreted and translated into actionable code. If you choose to build an external DSL, the next step is to build a parser that converts the custom syntax into an abstract syntax tree (AST) that the system can understand and process." This involves lexical, syntax, and semantic analysis. "Once the input is parsed into an AST, you need to interpret or compile it into executable code or actions. ( . . . ) Validation ensures that users of the DSL are following the rules of the language." This includes validation of the syntax first, and validation of the domain construct afterwards. [Medium](https://medium.com/@robertdennyson/building-your-own-custom-dsl-a-comprehensive-guide-9be7bb70524d)

Parsers:

- [ANTLR](https://github.com/antlr/antlr4), [ANTLR4 Go](https://github.com/antlr4-go/antlr)
- [yacc](https://pkg.go.dev/golang.org/x/tools/cmd/goyacc)

More sources:

- [Domain Specific Languages — Martin Fowler, with Rebecca Parsons (2010)](https://www.oreilly.com/library/view/domain-specific-languages/9780132107549/)
- [Domain Specific Language Prototyping and Design Made Easy](https://medium.com/outsystems-engineering/domain-specific-language-prototyping-and-design-made-easy-9cec69d2d0fc)
- [Master Domain Specific Languages: The Secret to Efficiency](https://stepmediasoftware.com/blog/domain-specific-language)
- [Designing a DSL That Perfectly Solves Your Problem (VIDEO)](https://www.youtube.com/watch?v=Dbni-j3Sa8g&t=20s)
- [The Role of DSLs in Architecture Design (VIDEO)](https://www.youtube.com/watch?v=gwaF16KPqgQ&t=5s)

### Architectural Decision/Domain Language

Core domain

- environment information: project root, language, build tool, source/test root, plugin
- components: module, package, file, type, member
- relations: dependencies, inheritance/abstractions
- exclusions

## Intemediate Representation

"An intermediate representation is any representation of a program “between” the source and target languages. (. . . ) A true intermediate representation is quite independent of the source and target languages, and yet very general, so that it can be used to build a whole family of compilers. [Loyola](https://cs.lmu.edu/~ray/notes/ir/)

While typically IRs are used in the context of compiling source code from a programming language to machine code as an intermediate data structure that is internally used for further processing [Wikipedia](https://en.wikipedia.org/wiki/Intermediate_representation), in our case, we need to compile our domain object to a representation that the plugins can use to compile architecture tests. Initially, we have one source (AD-Enforcement Tool) which creates an IR, and several targets (Plugins) which make use of it:

```cascii.app
                                          ┌──────────┐       
                                    ┌─────│ Plugin 1 │       
                                    │     └──────────┘       
 ┌──────────────┐       ┌────┐      │     ┌──────────┐       
 │ Source (ADE) │───────│ IR │──────┐─────│ Plugin 2 │       
 └──────────────┘       └────┘      │     └──────────┘       
                                    │     ┌────────────┐     
                                    └─────│ Plugin ... │     
                                          └────────────┘
```

However, by defining this IR it is possible to add more source languages, as long as they create a valid IR as well:

```cascii.app
┌──────────────┐                          ┌──────────┐       
│ Source (ADE) │───┐                ┌─────│ Plugin 1 │       
└──────────────┘   │                │     └──────────┘      
┌──────────────┐   │    ┌────┐      │     ┌──────────┐       
│ Source 2     │───┌────│ IR │──────┐─────│ Plugin 2 │       
└──────────────┘   │    └────┘      │     └──────────┘       
┌──────────────┐   │                │     ┌────────────┐     
│ Source ...   │───┘                └─────│ Plugin ... │     
└──────────────┘                          └────────────┘
```

### Option 1: JSON

"JSON (JavaScript Object Notation) is a lightweight data-interchange format." [json.org](https://www.json.org/json-en.html)

- Human readable
- Language-agnostic / built-in support by many languages
- [json schema](https://json-schema.org/understanding-json-schema/about)
- Not very efficient (string)

### Option 2: Protobuffer

"Protocol Buffers are language-neutral, platform-neutral extensible mechanisms for serializing structured data." [protobuf.dev](https://protobuf.dev/) "It’s like JSON, except it’s smaller and faster, and it generates native language bindings. You define how you want your data to be structured once, then you can use special generated source code to easily write and read your structured data to and from a variety of data streams and using a variety of languages." [protobuf.dev](https://protobuf.dev/overview/)

- Language neutral: support for many languages / [can be extended with plugins for new languages](https://protobuf.dev/reference/other/)
- Schema defnition (.proto file) to create source code
- [very efficient](https://medium.com/@kn2414e/is-protocol-buffers-protobuf-really-lighter-and-faster-compared-to-json-681c6bee5d93) (ideal for inter-service communication)
- Not human readable (binary data)

## Go

- [Open-source programming language, easy to learn, built-in concurrency, robust standard library, and large ecosystem](https://go.dev/)
- Good CLI tooling support: [viper](https://pkg.go.dev/github.com/spf13/viper), [cobra](https://pkg.go.dev/github.com/spf13/cobra), [cobra-cli](https://pkg.go.dev/github.com/spf13/cobra-cli)
- [Support for protobuf](https://github.com/golang/protobuf)

More sources:

- [Effective Go](https://go.dev/doc/effective_go)
- [Testing](https://go.dev/doc/tutorial/add-a-test)
- [Debugging](https://github.com/go-delve/delve)

# Architecture Decision Enforcement DSL (ADR-DSL)

**ADR-DSL** is a domain-specific language for encoding enforceable architectural decision rules derived from Architectural Decision Records (ADRs). The DSL is compiled into an intermediate representation (IR) and enforced via plugins (e.g., csharp, arch-go).

## File Structure

A rule file contains:

1. An ADR header: `adr "<id>" "<title>"`
2. Optional selector definitions: `component`, `class`, `interface`, `path`
3. One or more `rule` blocks with natural-language assertions

Example:

```dsl
adr "0006" "Domain layer is isolated"

component "Domain" = "src/domain"
component "Application" = "src/application"

rule "domain has no dependencies" {
  Domain must not depend_on Application
  severity error
}
```

## Language Reference

### 1. ADR Header

```dsl
adr "<id>" "<title>"
```

* **Required**: Must appear exactly once at the top of the file
* `<id>`: Should be a unique identifier corresponding to the ADR
* `<title>`: Title or short description of the ADR rule

### 2. Selectors

Selectors create named references to architectural elements. All selector types share the same syntax:

```dsl
<type> "<Name>" = "<pattern>"
```

#### Selector Types

| Type        | Purpose                                              | Pattern Example     |
| ----------- | ---------------------------------------------------- | ------------------- |
| `component` | Architectural components (layers, modules, packages) | `"MyApp.Domain.."`  |
| `class`     | Class types                                          | `"MyDomainClass"`   |
| `interface` | Interface types                                      | `"IRepository"`     |
| `path`      | Files/directories (glob patterns)                    | `"src/**/*.config"` |

#### Selector Naming Rules

* Names must be valid identifiers (letters, numbers, underscores)
* Names must not collide with keywords: `must`, `not`, `only`, `depend_on`, `exist`, `contain`, `implement`, `interface`, `match`, `exclude`, `class`, `component`, `path`, `severity`, `error`, `warning`
* Names are case-sensitive
* No duplicates allowed within a file

#### Examples

```dsl
component "Domain"      = "domain"
component "Application" = "application"
class "Handler"         = "EventHandler"
interface "IRepo"       = "IRepository"
path "Configs"          = "config/**/*.json"
```

### 3. Rules

A `rule` block contains assertions about architecture.

```dsl
rule "<rule_name>" {
  <assertion>
  [exclude <exclusion>]*
  severity <level>
}
```

* `<rule_name>`: Unique identifier for the rule
* `<assertion>`: The enforceable rule
* `exclude`: Optional exclusions to filter out false positives
* `severity`: `error` (default), `warning`

### 4. Rule Assertions

#### Extra-systemic Rules (Filesystem Checks)

Use `path` as the subject for file/directory checks.

##### Existence Checks

Examples:

```dsl
rule "modules_exist" {
  path "src/Modules/*/" must exist
  severity error
}


path "Configs" = "config/**/*.json"
rule "using_selector" {
  Configs must exist 
  severity warning
}
```

##### Content Checks

```dsl
<path_subject> must contain <pattern>
<path_subject> must not contain <pattern>
```

* `<pattern>`: String literal (substring match) or `regex:<regex>` for regex match

Examples:

```dsl
rule "no_external_dependencies" {
  path "**/*.csproj" must not contain "regex:RabbitMQ|MassTransit"
  severity error
}

rule "required_package" {
  path "Directory.Packages.props" must contain "NetArchTest.Rules"
  severity error
}
```

#### Intra-systemic Rules (Code Structure)

##### Component Dependency Rules

```dsl
<component_subject> must not depend_on <targets>
<component_subject> must only depend_on <targets>
```

* `<component_subject>`: Named selector (unquoted), inline literal (`component "pattern"`), or inline match (`component match "regex:pattern"`)
* `<targets>`: Comma-separated list of selectors, literals, or matches

Examples:

```dsl
# Using named selectors
component "Domain" = "MyApp.Domain"
component "Application" = "MyApp.Application"
component "Infrastructure" = "MyApp.Infrastructure"

rule "domain_isolated" {
  Domain must not depend_on Application, Infrastructure
  severity error
}

# Inline literal
rule "inline_example" {
  component "MyApp.API.." must only depend_on Domain
  severity error
}

# Inline match (regex)
rule "all_domain_layers" {
  component match "regex:.*\\.Domain\\..*" must not depend_on component match "regex:.*\\.Infrastructure\\..*"
  severity error
}
```

##### Class/Interface Rules

```dsl
<class_subject> must implement interface <interface_target>
```

* Works with named selectors, inline literals (`class "MyClass"`), or inline patterns (`class match "regex:.*Handler"`)

Examples:

```dsl
class "Handler" = "HandlerClass"

rule "handlers_implement_interface" {
  Handler must implement interface IHandler
  severity error
}

rule "inline_match" {
  class match "regex:.*Repository" must implement interface "IRepository"
  severity error
}
```

##### Annotation Rules

```dsl
<subject> must annotate "<annotation_name>"
```

* Checks that types have a specific annotation/attribute (e.g., C# `[AttributeName]`)
* Works with all subject types: named selectors, inline literals, inline match, and scoped subjects

Examples:

```dsl
rule "domain_classes_annotated" {
  class "Handler" must annotate "DomainAttribute"
  severity error
}

rule "all_domain_classes" {
  class in component "MyApp.Domain" must annotate "DomainAttribute"
  severity error
}
```

##### Subset Relation (`in`)

Subjects can be scoped to a parent selector using the `in` keyword. This creates a subset relation where the subject is filtered to only include elements within the given scope.

```dsl
<selectorType> in <targetExpr>
<selectorType> "<name>" in <targetExpr>
<selectorType> match "<pattern>" in <targetExpr>
```

* `<selectorType>`: `class`, `interface`, `component`, `path`
* `<targetExpr>`: A named selector or inline pattern defining the scope

Examples:

```dsl
component "Domain" = "MyApp.Domain"

# All classes within the Domain component
rule "annotate_domain" {
  class in Domain must annotate "DomainAttribute"
  severity error
}

# Specific class within a component
rule "handler_in_domain" {
  class "EventHandler" in Domain must annotate "Serializable"
  severity error
}

# Match pattern within inline component
rule "handlers_in_domain" {
  class match "regex:.*Handler" in component "MyApp.Domain" must annotate "Serializable"
  severity error
}

# Subset with dependency rules
rule "classes_in_domain_isolated" {
  class in Domain must not depend_on component "MyApp.Infrastructure"
  severity error
}
```

### 5. Exclusions

Exclusions filter out elements from the subject to avoid false positives. Available for all selector types.

```dsl
exclude <selector_type> <criterion> <pattern>
```

#### Exclusion Criteria

| Selector Type          | Example                                                |
| ---------------------- | ------------------------------------------------------ |
| `class` (literal)      | `exclude class "EventBusStartup"`                      |
| `class` (by interface) | `exclude class implementing interface "IEventHandler"` |
| `path`                 | `exclude "src/tests/**"`                               |
| `component`            | `exclude component "Shared.."`                         |

Examples:

```dsl
rule "modules_isolated" {
  Meetings must not depend_on Payments
  exclude class implementing interface "IEventHandler"
  exclude class "IntegrationEventHandler"
  severity error
}

rule "config_check" {
  path "**/*.json" must contain "version"
  exclude "test/**/*.json"
  severity warning
}
```

### 6. Inline vs Named Selectors

All rules support both approaches:

#### Named Selector (defined at top of file, referenced unquoted)

```dsl
component "Domain" = "MyApp.Domain.."

rule "example" {
  Domain must not depend_on Application
  severity error
}
```

#### Inline Literal (quoted pattern in rule)

```dsl
rule "example" {
  component "MyApp.Domain.." must not depend_on component "MyApp.Infrastructure.."
  severity error
}
```

#### Inline Match (regex pattern in rule)

```dsl
rule "example" {
  component match "regex:.*\\.Domain\\..*" must not depend_on component match "regex:.*\\.Infra\\..*"
  severity error
}
```

## Regex Prefix

* **Required** for regex patterns: `regex:<pattern>`
* **Without prefix**: treated as literal string/glob
* Applies to: component patterns (when using `match`), path content checks

## Static Validation Rules

The parser must reject a rule file if:

* ADR header is missing or appears multiple times
* Selector names are duplicated
* Selector names collide with reserved keywords
* Rule names are duplicated
* Referenced selector names don't exist (including `in` scope references)
* `must contain` patterns are missing the pattern argument
* `must annotate` is missing the annotation name
* Severity values are not `error` or `warning`

