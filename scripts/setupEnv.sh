#!/bin/bash
#set -o xtrace
FULL_PATH=$(dirname "$(realpath "$BASH_SOURCE")")/..

BUILD_DIR=$FULL_PATH/.build/$1
BUILD_CONF_DIR=$BUILD_DIR/conf
DL_DIR=$FULL_PATH/.download
SSTATE_DIR=$FULL_PATH/.sstate-cache
TMP_DIR=$FULL_PATH/.tmp/$1


mkdir -p $BUILD_CONF_DIR
mkdir -p $DL_DIR
mkdir -p $SSTATE_DIR
mkdir -p $TMP_DIR

chmod 777 $BUILD_DIR
chmod 777 $BUILD_CONF_DIR
chmod 777 $DL_DIR
chmod 777 $SSTATE_DIR
chmod 777 $TMP_DIR

echo -e "Configuring machine: $1"

case "$1" in
  "odroid-xu4")
   cp $FULL_PATH/conf/odroidxu4_bblayers.conf $BUILD_CONF_DIR/bblayers.conf
   cp $FULL_PATH/conf/odroidxu4_local.conf $BUILD_CONF_DIR/local.conf
   ;;
  "qemux86-64")
   cp $FULL_PATH/conf/qemux86_64_bblayers.conf $BUILD_CONF_DIR/bblayers.conf
   cp $FULL_PATH/conf/qemux86_64_local.conf $BUILD_CONF_DIR/local.conf
   ;;
  *)
   echo -e "Unkwon machine: $1"
   exit 1
   ;;
esac
chmod 777 $BUILD_CONF_DIR/bblayers.conf
chmod 777 $BUILD_CONF_DIR/local.conf

echo -e "Setting up container. Please standby..."
launch_args="--rm --ulimit nofile=899999:899999 --pids-limit=0 -i"
launch_args+=" -v $FULL_PATH:/home/builduser/mnt/arcadia:Z"
launch_args+=" -v $BUILD_DIR:/home/builduser/mnt/build:Z"
launch_args+=" -v $DL_DIR:/home/builduser/mnt/download:Z"
launch_args+=" -v $SSTATE_DIR:/home/builduser/mnt/sstate-cache:Z"
launch_args+=" -v $TMP_DIR:/tmp:Z"
launch_args+=" --workdir=/home/builduser/mnt/arcadia"
launch_args+=" yocto_ubuntu_22.04:latest"

if [ -z "$2" ]; then
  launch_args="-it ${launch_args} /bin/bash"
  readarray -t args < <(echo "$launch_args" | xargs)
  podman run ${args[@]}
else
  readarray -t args < <(echo "$launch_args" | xargs)
  podman run ${args[@]} /bin/bash -c "$2"
fi

