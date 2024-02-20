#!/bin/bash
./scripts/setupEnv.sh 'qemux86-64' 'source /home/builduser/mnt/arcadia/poky/oe-init-build-env /home/builduser/mnt/build && bitbake core-image-arcadia-dev'

IMG_DIR="${HOME}/qemux86-64"
rm -rf $IMG_DIR

cp -r .build/qemux86-64/tmp-glibc/deploy/images/qemux86-64 $IMG_DIR
echo -e "runScript completed!!"