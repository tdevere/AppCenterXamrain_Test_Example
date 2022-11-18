using System;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Threading;
using NUnit.Framework;
using Xamarin.UITest;
using Xamarin.UITest.Queries;

namespace UITestProject
{
    [TestFixture(Platform.Android)]
    [TestFixture(Platform.iOS)]
    public class Tests
    {
        string _XTC_DEVICE;

        IApp app;
        Platform platform;

        public Tests(Platform platform)
        {
            this.platform = platform;

            _XTC_DEVICE = "none";
            _XTC_DEVICE = System.Environment.GetEnvironmentVariable("XTC_DEVICE_NAME");

            if (string.IsNullOrEmpty(_XTC_DEVICE))
            {
                _XTC_DEVICE = "none";
            }
        }

        [SetUp]
        public void BeforeEachTest()
        {
            app = AppInitializer.StartApp(platform);
        }

        [Test]
        public void UITestScreen()
        {
            app.Tap(c => c.Marked("btnMyButton"));

            switch (_XTC_DEVICE)
            {
                case "none":
                    app.Screenshot("NONE");
                    break;
                case "Samsung Galaxy S21":
                    app.Screenshot("Samsung Galaxy S21");
                    break;
                case "Samsung Galaxy S21 Plus":
                    Thread.Sleep(TimeSpan.FromMinutes(2)); //Cause a delay
                    app.Screenshot("Samsung Galaxy S21 Plus");
                    break;
                default:
                    app.Screenshot($"{_XTC_DEVICE}_default");
                    break;
            }
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
