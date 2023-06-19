# noninteractive is just there so I don't get bugged with useless popups. this script does not actually work non interactively.

DEBIAN_FRONTEND=noninteractive apt-get update;
DEBIAN_FRONTEND=noninteractive apt-get upgrade -y;

DEBIAN_FRONTEND=noninteractive apt-get install ca-certificates curl gnupg git;
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg;
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null;
DEBIAN_FRONTEND=noninteractive apt-get update;
DEBIAN_FRONTEND=noninteractive apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin;

# Final
docker login -u masquernya; # should prompt for password.
git clone https://github.com/masquernya/lemmy-arm64;
cd lemmy-arm64;
sudo ./build_latest.sh;