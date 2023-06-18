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

# bug fix: https://github.com/nodejs/docker-node/issues/1912
sed -i 's/node:alpine/node:20-alpine3.16/g' Dockerfile;

docker build . -t arm64v8/ubuntu --tag="masquernya/lemmy-ui:$LEMMY_VERSION-linux-arm64";