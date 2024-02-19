#!/bin/bash
./scripts/setupEnv.sh 'qemux86-64' 'source /home/builduser/mnt/arcadia/poky/oe-init-build-env /home/builduser/mnt/build && bitbake core-image-arcadia'
cp -r .build/qemux86-64/tmp-glibc/deploy/images/qemux86-64 $HOME/