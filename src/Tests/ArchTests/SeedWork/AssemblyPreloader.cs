using System.Reflection;
using NUnit.Framework;

// No namespace — a [SetUpFixture] without a namespace applies to the entire
// assembly, so this runs before any test class in the project.
[SetUpFixture]
public class AssemblyPreloader
{
    [OneTimeSetUp]
    public void LoadAllProjectAssemblies()
    {
        // Types.InCurrentDomain() only scans assemblies that are already loaded
        // into the AppDomain at the moment it is called. .NET loads assemblies
        // lazily, so module assemblies that are transitively referenced but not
        // directly touched in test code won't be present yet.
        // This fixture runs once before any test in this assembly. It scans the
        // output directory for all CompanyName.MyMeetings.*.dll files and loads
        // any that are not yet in the AppDomain, ensuring every module assembly
        // is available when the generated architecture tests call InCurrentDomain().
        var loaded = AppDomain.CurrentDomain.GetAssemblies()
            .Where(a => !a.IsDynamic)
            .Select(a => a.Location)
            .ToHashSet(StringComparer.OrdinalIgnoreCase);

        var dir = Path.GetDirectoryName(typeof(AssemblyPreloader).Assembly.Location)!;
        foreach (var dll in Directory.GetFiles(dir, "CompanyName.MyMeetings.*.dll"))
        {
            if (!loaded.Contains(dll))
            {
                Assembly.LoadFrom(dll);
            }
        }
    }
}
