#!/bin/bash

git submodule update --init --recursive

[ -e src/aic94xx/aic94xx_init.c.back ] || \
	sed -i .back -e 's/\(^#define ASD_DRIVER_VERSION "[^"]*\)/\1-hotfix/' src/aic94xx/aic94xx_init.c

docker run -it --rm -v $(pwd):/sources debian:stretch /sources/build-all.sh
