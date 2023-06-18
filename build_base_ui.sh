git clone https://github.com/LemmyNet/lemmy-ui.git;
cd lemmy-ui;
git fetch --tags;
git submodule init;
git submodule update --recursive --remote;
# manual updates
cd lemmy-translations/;
git checkout "$TRANSLATION_COMMIT" || exit 1;
cd ../;
git checkout "$LEMMY_VERSION";

docker build . -t arm64v8/ubuntu --tag="masquernya/lemmy:$LEMMY_VERSION-linux-arm64";