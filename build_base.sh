# Do not run this script directly. Use versions/(version).sh or ./build_latest.sh instead.


# apt-get install qemu binfmt-support qemu-user-static;
export DOCKER_BUILDKIT=1;
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

docker buildx create --use;
docker build . --platform linux/arm64 --file ./docker/prod/Dockerfile.arm  --tag="masquernya/lemmy:$LEMMY_VERSION-linux-arm64";

echo "Successfully built lemmy backend. Start UI.";
exit 1;

cd ../;
chmod +x build_base_ui.sh;
./build_base_ui.sh;
