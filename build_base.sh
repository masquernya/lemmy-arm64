# Do not run this script directly. Use versions/(version).sh or ./build_latest.sh instead.


# Source for qemu stuff: https://www.stereolabs.com/docs/docker/building-arm-container-on-x86/
# apt-get install qemu binfmt-support qemu-user-static;
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes || exit 1; # This step will execute the registering scripts
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

docker build . --file ./docker/prod/Dockerfile.arm -t arm64v8/ubuntu --tag="masquernya/lemmy:$LEMMY_VERSION-linux-arm64";

echo "Successfully built lemmy backend. Start UI.";

cd ../;
chmod +x build_base_ui.sh;
./build_base_ui.sh;
