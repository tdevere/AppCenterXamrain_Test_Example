using System;
using Xamarin.UITest;
using Xamarin.UITest.Queries;

namespace UITestProject
{
    public class AppInitializer
    {
        public static IApp StartApp(Platform platform)
        {
            if (platform == Platform.Android)
            {
                return ConfigureApp
                    .Android
                    .ApkFile(@"C:\Users\tdevere\source\repos\AppCenterXamrain_Test_Example\AppCenterXamrain_Test_Example\bin\Debug\com.companyname.appcenterxamrain_test_example.apk")
                    .StartApp();
            }

            return ConfigureApp.iOS.StartApp();
        }
    }
}