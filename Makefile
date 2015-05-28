PWD != pwd
BOOTSTRAP  := ${PWD}/../beastix/bootstrap/tools
CC         := ${BOOTSTRAP}/bin/x86_64-unknown-linux-musl-gcc
CCFLAGS    := -I${PWD}/obj/bsdtools/_install/include/ -I${BOOTSTRAP}/include -I${SRC_ROOT}/libisofs/libisofs -fPIC
SRC_ROOT := ${PWD}
CPPFLAGS := -I${PWD}/obj/bsdtools/_install/include/ -I${BOOTSTRAP}/include -I${SRC_ROOT}/libisofs/libisofs 
 
build-libburn:
	mkdir -p ${SRC_ROOT}/obj/libburn
	export PATH=${BOOTSTRAP}/tools/bin:/bin:/usr/bin; export CC=${CC}; export CCFLAGS="${CCFLAGS}"; cd ${SRC_ROOT}/obj/libburn; ${SRC_ROOT}/libburn/configure --prefix=${SRC_ROOT}/obj/cdrkit/_install \
	                                                                                                                                                                --target=x86_64-unknown-linux-musl \
																					--host=x86_64-unknown-linux-musl --disable-shared
	export PATH=${BOOTSTRAP}/tools/bin:/bin:/usr/bin; export CC=${CC}; export CCFLAGS="${CCFLAGS}"; make -C ${SRC_ROOT}/obj/libburn install

build-libisofs:
	mkdir -p ${SRC_ROOT}/obj/libisofs
	export PATH=${BOOTSTRAP}/tools/bin:/bin:/usr/bin; export CC=${CC}; export CCFLAGS="${CCFLAGS}"; export CPPFLAGS="${CPPFLAGS}"; cd ${SRC_ROOT}/obj/libisofs; ${SRC_ROOT}/libisofs/configure --prefix=${SRC_ROOT}/obj/cdrkit/_install \
	                                                                                                                                                                --target=x86_64-unknown-linux-musl \
																					--host=x86_64-unknown-linux-musl --disable-shared --disable-libacl --disable-xattr --disable-zlib --disable-libjte
	export PATH=${BOOTSTRAP}/tools/bin:/bin:/usr/bin; export CC=${CC}; export CCFLAGS="${CCFLAGS}"; make -C ${SRC_ROOT}/obj/libisofs all install

build-cdrkit: build-libburn build-libisofs
	mkdir -p ${SRC_ROOT}/obj/cdrkit
