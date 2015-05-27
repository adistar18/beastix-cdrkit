PWD != pwd
BOOTSTRAP  := ${PWD}/../beastix/bootstrap/tools
CC         := ${BOOTSTRAP}/bin/x86_64-unknown-linux-musl-gcc
CCFLAGS    := -I${PWD}/obj/bsdtools/_install/include/ -I${BOOTSTRAP}/include -fPIC
SRC_ROOT := ${PWD}

build-libburn:
	mkdir -p ${SRC_ROOT}/obj/libburn
	export PATH=${BOOTSTRAP}/tools/bin:/bin:/usr/bin; export CC=${CC}; export CCFLAGS="${CCFLAGS}"; cd ${SRC_ROOT}/obj/libburn; ${SRC_ROOT}/libburn/configure --prefix=${SRC_ROOT}/obj/libburn/_install \
	                                                                                                                                                                --target=x86_64-unknown-linux-musl \
																					--host=x86_64-unknown-linux-musl --disable-shared
	export PATH=${BOOTSTRAP}/tools/bin:/bin:/usr/bin; export CC=${CC}; export CCFLAGS="${CCFLAGS}"; make -C ${SRC_ROOT}/obj/libburn
