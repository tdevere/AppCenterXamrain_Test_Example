using System;
using System.IO;
using System.Linq;
using NUnit.Framework;
using Xamarin.UITest;
using Xamarin.UITest.Queries;

namespace UITestProject
{

    [TestFixture(Platform.Android)]
    [TestFixture(Platform.iOS)]
    public class Tests
    {
        IApp app;
        Platform platform;

        public Tests(Platform platform)
        {
            this.platform = platform;
        }

        [SetUp]
        public void BeforeEachTest()
        {
            app = AppInitializer.StartApp(platform);

            
        }

        [Test]
        [Category("Category1")]
        public void UITestScreen()
        {
            app.Tap(c => c.Marked("btnMyButton"));
            app.Screenshot("UI TEST Screen");

        }

        [Test]
        [Category("Category2")]
        public void UITestScreen2()
        {
            app.Tap(c => c.Marked("btnMyButton"));
            app.Screenshot("UI TEST Screen 2");

        }
    }
}
