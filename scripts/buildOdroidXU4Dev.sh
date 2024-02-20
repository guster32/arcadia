#!/bin/bash
./scripts/setupEnv.sh 'odroid-xu4' 'source /home/builduser/mnt/arcadia/poky/oe-init-build-env /home/builduser/mnt/build && bitbake core-image-arcadia-dev'

IMG_DIR="${HOME}/odroidxu4"
rm -rf $IMG_DIR
mkdir -p $IMG_DIR

cp .build/odroid-xu4/tmp-glibc/deploy/images/odroid-xu4/core-image-arcadia-dev-odroid-xu4.rootfs.wic.xz $IMG_DIR
cp .build/odroid-xu4/tmp-glibc/deploy/images/odroid-xu4/ore-image-arcadia-dev-odroid-xu4.rootfs.wic.bmap $IMG_DIR

echo -e "sudo bmaptool copy --bmap core-image-arcadia-dev-odroid-xu4.rootfs.wic.bmap core-image-arcadia-dev-odroid-xu4.rootfs.wic.xz  /dev/[USB_BLOCK]\n" >> $IMG_DIR/readme
echo -e "wpa_passphrase [SSID] >> /etc/wpa_supplicant.conf" >> $IMG_DIR/readme
echo -e "...type in the passphrase and hit enter..."  >> $IMG_DIR/readme
echo -e "systemctl enable network-wireless@[wireless-if].service" >> $IMG_DIR/readme
echo -e "runScript completed!!"