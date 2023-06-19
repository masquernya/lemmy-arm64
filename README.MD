# Lemmy ARM64 Images

[hub.docker.com/r/masquernya/lemmy/tags](https://hub.docker.com/r/masquernya/lemmy/tags)

This is mostly for personal use. You're free to use the created images if you want, but I can't promise timely updates, bug fixes, vulnerability fixes, etc. I'll try to keep this up-to-date for as long as I'm using lemmy.

If lemmy starts releasing official ARM64 images again, you should use those instead.

# Build Time

Duration in seconds for step 6 (build).


**x86-64 QEMU (BuildX)**
- 3240s on my x86-64 laptop with an AMD CPU

**ARM64 (native)**
- 451s on Hetzner VPS cax41 (16 Core, 32 GB RAM, Ampere Altra Q80-30)
    - You can pay by the hour, so this only works out to about $0.04 per build.