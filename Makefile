run:
	xcodebuild -workspace Sample/Sample.xcodeproj/project.xcworkspace -scheme SampleTests -sdk iphonesimulator build test | xcpretty -c
