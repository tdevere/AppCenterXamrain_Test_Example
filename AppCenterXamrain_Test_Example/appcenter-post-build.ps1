    ##Fix Specific Version of Xamarin.UITest
    $projectFile =  '/Users/runner/work/1/a/GeneratedTest/AppCenter.UITest.Android/AppCenter.UITest.Android.csproj'
    Write-Host "Project File Before Change"
    (Get-Content $projectFile)
    
    $packagesFile = '/Users/runner/work/1/a/GeneratedTest/AppCenter.UITest.Android/packages.config'
    Write-Host "Package File Before Change"
    (Get-Content $packagesFile)

    (Get-Content $projectFile).Replace("Xamarin.UITest.4.0.0", "Xamarin.UITest.3.2.9") | Set-Content $projectFile
    Write-Host "Project File After Change"
    Get-Content $projectFile
    
    (Get-Content $packagesFile).Replace('4.0.0','3.2.9') | Set-Content $packagesFile
    Write-Host "Package File After Change"
    Get-Content $packagesFile
