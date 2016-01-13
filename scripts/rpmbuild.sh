#!/bin/sh

./autogen.sh
./configure
make clean
make dist
git log --format="* %cd %aN%n- (%h) %s%d%n" --date=local | sed -r 's/[0-9]+:[0-9]+:[0-9]+ //' >> fuse-7z-ng.spec
mkdir -p $HOME/rpmbuild/SOURCES
cp fuse-7z-ng-*.tar.gz $HOME/rpmbuild/SOURCES
rpmbuild -ba fuse-7z-ng.spec
