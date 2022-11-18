Write-Host "The Post Build Script START"
Write-Host "AppCenterXamrain_Test_Example"

if (!$env:AppCenterTokenForTest)
{
    Write-Host "This script only runs within the context of App Center builds"
    exit
}
else
{

    appcenter login --token $AppCenterTokenForTest

    appcenter test generate uitest --platform android --output-path /Users/runner/work/1/a/GeneratedTest

    ##Fix Specific Version of Xamarin.UITest
    $projectFile = '/Users/runner/work/1/a/GeneratedTest/AppCenter.UITest.Android/AppCenter.UITest.Android.csproj'
    $packagesFile = '/Users/runner/work/1/a/GeneratedTest/AppCenter.UITest.Android/packages.config'

    (Get-Content $projectFile).Replace("Xamarin.UITest.4.0.0", "Xamarin.UITest.3.2.9") | Set-Content  $projectFilej
    Get-Content $projectFile
    (Get-Content $packagesFile).Replace('4.0.0','3.2.9') | Set-Content  $packagesFile
    Get-Content $packagesFile

    nuget restore -NonInteractive /Users/runner/work/1/a/GeneratedTest/AppCenter.UITest.Android.sln

    xbuild /Users/runner/work/1/a/GeneratedTest/AppCenter.UITest.Android.sln /p:Configuration=Release

    appcenter test prepare uitest --artifacts-dir /Users/runner/work/1/a/Artifacts --app-path /Users/runner/work/1/a/build/com.ManualTestOnDevice.ReleaseTest1.apk --build-dir /Users/runner/work/1/a/GeneratedTest/AppCenter.UITest.Android/bin/Release --debug --quiet

    #Debug Line
    Write-Host "cat /Users/runner/work/1/a/Artifacts/manifest.json"
    Get-Content '/Users/runner/work/1/a/Artifacts/manifest.json'

    appcenter test run manifest --manifest-path /Users/runner/work/1/a/Artifacts/manifest.json --app-path /Users/runner/work/1/a/build/com.ManualTestOnDevice.yourapp.apk --app AppCenterSupportDocs/ManualTestOnDevice --devices any_top_1_device --test-series launch-tests --locale en_US -p msft/test-run-origin=Build/Launch --debug --quiet --token $AppCenterTokenForTest

}

Write-Host  "The Post Build Script END"