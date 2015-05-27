LIBROLS_OBJECTS := ${OBJ_DIR}/librols/astoi.o      ${OBJ_DIR}/librols/cmpbytes.o  ${OBJ_DIR}/librols/fexec.o      ${OBJ_DIR}/librols/getav0.o         ${OBJ_DIR}/librols/gethostname.o  ${OBJ_DIR}/librols/raisecond.o  ${OBJ_DIR}/librols/snprintf.o  ${OBJ_DIR}/librols/streql.o \
                   ${OBJ_DIR}/librols/astoll.o     ${OBJ_DIR}/librols/comerr.o    ${OBJ_DIR}/librols/fillbytes.o  ${OBJ_DIR}/librols/getdomainname.o  ${OBJ_DIR}/librols/getpagesize.o  ${OBJ_DIR}/librols/rename.o     ${OBJ_DIR}/librols/spawn.o     ${OBJ_DIR}/librols/swabbytes.o \
                   ${OBJ_DIR}/librols/astoull.o    ${OBJ_DIR}/librols/default.o   ${OBJ_DIR}/librols/findbytes.o  ${OBJ_DIR}/librols/geterrno.o       ${OBJ_DIR}/librols/handlecond.o   ${OBJ_DIR}/librols/saveargs.o   ${OBJ_DIR}/librols/strcatl.o   ${OBJ_DIR}/librols/usleep.o \
                   ${OBJ_DIR}/librols/breakline.o  ${OBJ_DIR}/librols/error.o     ${OBJ_DIR}/librols/getargs.o    ${OBJ_DIR}/librols/gethostid.o      ${OBJ_DIR}/librols/movebytes.o    ${OBJ_DIR}/librols/seterrno.o   ${OBJ_DIR}/librols/strdup.o

${OBJ_DIR}/librols/%.o: ${SRC_ROOT}/librols/%.c
	${CC} ${CCFLAGS} -c $< -o $@


${OBJ_DIR}/librols.a: ${LIBROLS_OBJECTS}
	ar rcs $@ $^

