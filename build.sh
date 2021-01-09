PROJECT_NAME=Lokalise
FRAMEWORK_NAME=${PROJECT_NAME}.framework
XCFRAMEWORK_NAME=${PROJECT_NAME}.xcframework
XCFRAMEWORKZIP_NAME=${PROJECT_NAME}.xcframework.zip
XCFRAMEWORKZIP_PATH=${XCFRAMEWORKZIP_NAME}
SCRIPT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")"
BUILD_PATH=`dirname $SCRIPT`

# Grab archs

archs="$(lipo -info "${BUILD_PATH}/${FRAMEWORK_NAME}/${PROJECT_NAME}" | rev | cut -d ':' -f1 | rev)"

# Exclude some archs

archs=("${archs[@]/"armv7"}")
archs=("${archs[@]/"i386"}")

# Make copies of fat framework
for arch in $archs; do
  mkdir "${arch}"
  FRAMEWORK_PATH="${BUILD_PATH}/${arch}/${FRAMEWORK_NAME}"
  cp -r "${BUILD_PATH}/${FRAMEWORK_NAME}" "${FRAMEWORK_PATH}"
  rm "${FRAMEWORK_PATH}/strip-frameworks.sh"
done

FRAMEWORKS=""

# Strip archs
for arch in $archs; do
  FRAMEWORK_PATH="${BUILD_PATH}/${arch}/${FRAMEWORK_NAME}"
  BINARY_PATH="${FRAMEWORK_PATH}/${PROJECT_NAME}"
  lipo -thin $arch "${BINARY_PATH}" -output "${BINARY_PATH}"
  FRAMEWORKS+="-framework ${FRAMEWORK_PATH} "
done

# Build xcframework

rm -r ${XCFRAMEWORK_NAME}
xcodebuild -create-xcframework ${FRAMEWORKS} -output ${XCFRAMEWORK_NAME}

# Zip it

rm -r ${XCFRAMEWORKZIP_PATH}
zip -vr ${XCFRAMEWORKZIP_PATH} ${XCFRAMEWORK_NAME} -x "*.DS_Store"

# Calculate hash
echo "XCFramework checksum: " $(swift package compute-checksum ${XCFRAMEWORKZIP_PATH})

# Clean

rm -r ${XCFRAMEWORK_NAME}
for arch in $archs; do
  rm -r "${arch}"
done

open ${BUILD_PATH}
