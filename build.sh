export LEMMY_VERSION="0.18.4";
export TRANSLATION_COMMIT="b122306e52d94807528068a7e8f8011c29d31db1";

git clone https://github.com/LemmyNet/lemmy.git || exit 1;
cd lemmy;
git fetch --tags;
git submodule init;
git submodule update --recursive --remote;
# manual updates
cd crates/utils/translations/;
git checkout "$TRANSLATION_COMMIT" || exit 1;
cd ../../../;
git checkout "$LEMMY_VERSION";

rm -f ./docker/Dockerfile && cp ../Dockerfile ./docker/ || exit 1;

docker build . --build-arg RUST_RELEASE_MODE=release --build-arg CARGO_BUILD_TARGET=aarch64-unknown-linux-gnu --platform linux/arm64 --file ./docker/Dockerfile --tag="masquernya/lemmy:$LEMMY_VERSION-linux-arm64" || exit 1;

echo "Successfully built lemmy backend. Release.";

docker push "masquernya/lemmy:$LEMMY_VERSION-linux-arm64" || exit 1;

echo "Successfully pushed $LEMMY_VERSION. Build UI";

cd ../;
chmod +x build_ui.sh;
./build_ui.sh;
