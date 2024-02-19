#!/bin/bash
#set -o xtrace
# FULL_PATH="$(dirname $0)"

# BUILD_DIR=$FULL_PATH/.build

# CONTAINER_BUILD_DIR=/home/builduser/mnt/build
# CONTAINER_DL_DIR=/home/builduser/mnt/downloads
# CONTAINER_SSTATE_DIR=/home/builduser/mnt/sstate-cache
# CONTAINER_TMP_DIR=/tmp

# mkdir -p $BUILD_DIR
# mkdir -p $DL_DIR
# mkdir -p $SSTATE_DIR
# mkdir -p $TMP_DIR

# chmod 777 $BUILD_DIR
# chmod 777 $DL_DIR
# chmod 777 $SSTATE_DIR
# chmod 777 $TMP_DIR

#docker run --rm -v ${workspaceFolder}:${workspaceFolder} crops/poky --workdir=${workspaceFolder} /bin/bash -c

# echo "Setting up container. Please standby..."
# podman run --rm --ulimit nofile=899999:899999 --pids-limit=0 -i \
#   -v $FULL_PATH/../meta-arcadia:/home/builduser/meta-arcadia:Z \
#   -v $BUILD_DIR:$CONTAINER_BUILD_DIR:Z \
#   -v $DL_DIR:$CONTAINER_DL_DIR:Z \
#   -v $SSTATE_DIR:$CONTAINER_SSTATE_DIR:Z \
#   -v $TMP_DIR:$CONTAINER_TMP_DIR:Z \
#   yocto_ubuntu_22.04:nanbield \
#   /bin/bash -c
