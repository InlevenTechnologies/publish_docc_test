##!/bin/sh

xcrun xcodebuild docbuild \
    -scheme DoccPublishTest \
    -destination 'generic/platform=iOS Simulator' \
    -derivedDataPath "$PWD/.derivedData"

xcrun docc process-archive transform-for-static-hosting \
    "$PWD/.derivedData/Build/Products/Debug-iphonesimulator/DoccPublishTest.doccarchive" \
    --output-path ".docs" \
    --hosting-base-path "publish_docc_test"

echo '<script>window.location.href += "/documentation/doccpublishtest"</script>'> .docs/index.html