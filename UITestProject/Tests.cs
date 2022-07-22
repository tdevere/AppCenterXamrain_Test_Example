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
        public void UITestScreen()
        {
            //AppResult[] results = app.WaitForElement(c => c.Class
            //AppResult[] results = app.WaitForElement(c => c.Marked("Welcome to Xamarin.Forms!"));
            //app.Screenshot("Welcome screen.");
            //Assert.IsTrue(results.Any());
            //btnMyButton

            app.Tap(c => c.Marked("btnMyButton"));
            app.Screenshot("UI TEST Screen");

        }

        [Test]
        public void UITestScreen2()
        {
            //AppResult[] results = app.WaitForElement(c => c.Class
            //AppResult[] results = app.WaitForElement(c => c.Marked("Welcome to Xamarin.Forms!"));
            //app.Screenshot("Welcome screen.");
            //Assert.IsTrue(results.Any());
            //btnMyButton

            app.Tap(c => c.Marked("btnMyButton"));
            app.Screenshot("UI TEST Screen 2");

        }
    }
}
