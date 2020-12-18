# NewYorkTimeNews
  NewYorkTimes Most popular News Api
1. MVVM design archtecture used
2. Unit test included
3. Code coverage (To enable code coverage - In edit scheme- Test - Option - Check manually Gather coverage)
 
To build app without xcode 

- Clone the repostory and go the project path.
- Copy the the below script and paste into terminal

xcodebuild clean build -workspace "NYNewsTimes.xcworkspace" -scheme "NYNewsTimes" CODE_SIGNING_ALLOWED=NO

To Run the test use below script

xcodebuild -workspace "NYNewsTimes.xcworkspace" -scheme "NYNewsTimes" -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 11,OS=14.2' test
