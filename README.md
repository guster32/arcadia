# arcadia


## Create build container
```bash
user=builduser uid=1000 gid=1000 buildah unshare scripts/createYoctoContainer.sh 2>&1 | tee buildlog
```