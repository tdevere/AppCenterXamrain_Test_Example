#!/usr/bin/env bash
echo "The Post Build Script START"

if [ -z "$AppCenterTokenForTest" ]
then 
    echo "This script only runs within the context of App Center builds"
    exit
fi

appcenter login --token $AppCenterTokenForTest

appcenter test generate uitest --platform android --output-path /Users/runner/work/1/a/GeneratedTest

nuget restore -NonInteractive /Users/runner/work/1/a/GeneratedTest/AppCenter.UITest.Android.sln

xbuild /Users/runner/work/1/a/GeneratedTest/AppCenter.UITest.Android.sln /p:Configuration=Release

appcenter test prepare uitest --artifacts-dir /Users/runner/work/1/a/Artifacts --app-path /Users/runner/work/1/s/AppCenterXamrain_Test_Example/bin/Debug/com.companyname.appcenterxamrain_test_example.apk --build-dir /Users/runner/work/1/a/GeneratedTest/AppCenter.UITest.Android/bin/Release --debug --quiet

#Debug Line
echo "cat /Users/runner/work/1/a/Artifacts/manifest.json"
cat /Users/runner/work/1/a/Artifacts/manifest.json

appcenter test run manifest --manifest-path /Users/runner/work/1/a/Artifacts/manifest.json --app-path /Users/runner/work/1/s/AppCenterXamrain_Test_Example/bin/Debug/com.companyname.appcenterxamrain_test_example.apk --app Examples/Android_Xamarin_UI_Test --devices "Examples/tdevere-device-set-1" --test-series launch-tests --locale en_US -p msft/test-run-origin=Build/Launch --debug --quiet --test-chunk --token $AppCenterTokenForTest

echo "The Post Build Script END"