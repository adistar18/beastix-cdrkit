PWD != pwd
BOOTSTRAP  := ${PWD}/../beastix/bootstrap/tools
CC         := ${BOOTSTRAP}/bin/x86_64-unknown-linux-musl-gcc
CCFLAGS    := -I${PWD}/obj/cdrkit/_install/include/ -I${BOOTSTRAP}/include -I${SRC_ROOT}/libisofs/libisofs -L${PWD}/obj/cdrkit/_install/lib/ -fPIC -static
SRC_ROOT := ${PWD}
CPPFLAGS := -I${PWD}/obj/cdrkit/_install/include -I${BOOTSTRAP}/include -I${SRC_ROOT}/libisofs/libisofs 
 
build-libburn:
	mkdir -p ${SRC_ROOT}/obj/libburn
	export PATH=${BOOTSTRAP}/tools/bin:/bin:/usr/bin; export CC=${CC}; export CCFLAGS="${CCFLAGS}"; cd ${SRC_ROOT}/obj/libburn; ${SRC_ROOT}/libburn/configure --prefix=${SRC_ROOT}/obj/cdrkit/_install \
	                                                                                                                                                                --target=x86_64-unknown-linux-musl --disable-shared \
																					--host=x86_64-unknown-linux-musl --with-pic
	export PATH=${BOOTSTRAP}/tools/bin:/bin:/usr/bin; export CC=${CC}; export CCFLAGS="${CCFLAGS}"; make -C ${SRC_ROOT}/obj/libburn install

build-libisofs:
	mkdir -p ${SRC_ROOT}/obj/libisofs
	export PATH=${BOOTSTRAP}/tools/bin:/bin:/usr/bin; export CC=${CC}; export CCFLAGS="${CCFLAGS}"; export CPPFLAGS="${CPPFLAGS}"; cd ${SRC_ROOT}/obj/libisofs; ${SRC_ROOT}/libisofs/configure --prefix=${SRC_ROOT}/obj/cdrkit/_install \
	                                                                                                                                                                --target=x86_64-unknown-linux-musl --with-pic --disable-shared \
																					--host=x86_64-unknown-linux-musl --disable-libacl --disable-xattr --disable-zlib --disable-libjte
	export PATH=${BOOTSTRAP}/tools/bin:/bin:/usr/bin; export CC=${CC}; export CCFLAGS="${CCFLAGS}"; make -C ${SRC_ROOT}/obj/libisofs all install

build-libisoburn:
	mkdir -p ${SRC_ROOT}/obj/libisoburn
	export PATH=${BOOTSTRAP}/tools/bin:/bin:/usr/bin; export CC=${CC}; export CCFLAGS="${CCFLAGS}"; export CPPFLAGS="${CPPFLAGS}"; cd ${SRC_ROOT}/obj/libisoburn; export LDFLAGS="-L${PWD}/obj/cdrkit/_install/lib"; ${SRC_ROOT}/libisoburn/configure \
																					--prefix=${SRC_ROOT}/obj/cdrkit/_install \
	                                                                                                                                                                --target=x86_64-unknown-linux-musl \
																					--host=x86_64-unknown-linux-musl  --with-pic --disable-shared \
	                                                                                                                                                                --disable-libacl --disable-zlib --disable-libreadline \
	                                                                                                                                                                --disable-xattr --disable-libjte --disable-ldconfig-at-install
	export PATH=${BOOTSTRAP}/tools/bin:/bin:/usr/bin; export CC=${CC}; export CCFLAGS="${CCFLAGS}"; make -C ${SRC_ROOT}/obj/libisoburn all install

build-cdrkit: build-libburn build-libisofs build-libisoburn
	mkdir -p ${SRC_ROOT}/obj/cdrkit
