
using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Hosting;

namespace angular_dotnet_scaffolding
{
    public class Program
    {
        public static void Main(string[] args)
        {
            BuildWebHost(args).Run();
        }

        public static IWebHost BuildWebHost(string[] args) =>
            WebHost.CreateDefaultBuilder(args)
                .UseKestrel()
                .UseLibuv()
                .UseStartup<Startup>()
                .Build();
    }
}
