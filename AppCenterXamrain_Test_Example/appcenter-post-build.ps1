    ##Fix Specific Version of Xamarin.UITest
    $projectFile =  '/Users/runner/work/1/a/GeneratedTest/AppCenter.UITest.Android/AppCenter.UITest.Android.csproj'
    $packagesFile = '/Users/runner/work/1/a/GeneratedTest/AppCenter.UITest.Android/packages.config'

    (Get-Content $projectFile).Replace("Xamarin.UITest.4.0.0", "Xamarin.UITest.3.2.9") | Set-Content  $projectFile
    Get-Content $projectFile
    (Get-Content $packagesFile).Replace('4.0.0','3.2.9') | Set-Content  $packagesFile
    Get-Content $packagesFile
