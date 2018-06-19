using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(AccountInv.Startup))]
namespace AccountInv
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
