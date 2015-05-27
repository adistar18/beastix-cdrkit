GENISOIMAGE_OBJECTS := ${OBJ_DIR}/genisoimage/apple.o \
${OBJ_DIR}/genisoimage/desktop.o \
${OBJ_DIR}/genisoimage/dvd_file.o \
${OBJ_DIR}/genisoimage/dvd_reader.o \
${OBJ_DIR}/genisoimage/eltorito.o \
${OBJ_DIR}/genisoimage/exclude.o \
${OBJ_DIR}/genisoimage/files.o \
${OBJ_DIR}/genisoimage/fnmatch.o \
${OBJ_DIR}/genisoimage/hash.o \
${OBJ_DIR}/genisoimage/ifo_read.o \
${OBJ_DIR}/genisoimage/match.o \
${OBJ_DIR}/genisoimage/multi.o \
${OBJ_DIR}/genisoimage/name.o \
${OBJ_DIR}/genisoimage/rock.o \
${OBJ_DIR}/genisoimage/scsi.o \
${OBJ_DIR}/genisoimage/stream.o \
${OBJ_DIR}/genisoimage/tree.o \
${OBJ_DIR}/genisoimage/udf.o \
${OBJ_DIR}/genisoimage/vms.o \
${OBJ_DIR}/genisoimage/volume.o \
${OBJ_DIR}/genisoimage/write.o \
${OBJ_DIR}/genisoimage/md5.o \
${OBJ_DIR}/genisoimage/rsync.o \
${OBJ_DIR}/genisoimage/boot-mipsel.o \
${OBJ_DIR}/genisoimage/endian.o \
${OBJ_DIR}/genisoimage/genisoimage.o

${OBJ_DIR}/genisoimage/%.o: genisoimage/%.c
	${CC} ${CCFLAGS} -I${SRC_ROOT}/genisoimage -c -DSORTING=0 -DUDF=0 -DPREP_BOOT=1 $< -o $@


${OBJ_DIR}/genisoimage/genisoimage: ${OBJ_DIR}/librols.a ${GENISOIMAGE_OBJECTS}
	${CC} ${CCFLAGS} $^ -o $@
	

build-genisoimage: ${OBJ_DIR}/genisoimage/genisoimage
