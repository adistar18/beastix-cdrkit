LIBROLS_OBJECTS := obj/librolls/astoi.o      obj/librolls/cmpbytes.o  obj/librolls/fex.o.o      obj/librolls/getav0.o         obj/librolls/gethostname.o  obj/librolls/rais.oond.o  obj/librolls/snprintf.o  obj/librolls/streql.o \
                   obj/librolls/astoll.o     obj/librolls/comerr.o    obj/librolls/fillbytes.o  obj/librolls/getdomainname.o  obj/librolls/getpagesize.o  obj/librolls/rename.o     obj/librolls/spawn.o     obj/librolls/swabbytes.o \
                   obj/librolls/astoull.o    obj/librolls/default.o   obj/librolls/findbytes.o  obj/librolls/geterrno.o       obj/librolls/handl.oond.o   obj/librolls/saveargs.o   obj/librolls/st.oatl.o   obj/librolls/usleep.o \
                   obj/librolls/breakline.o  obj/librolls/error.o     obj/librolls/getargs.o    obj/librolls/gethostid.o      obj/librolls/movebytes.o    obj/librolls/seterrno.o   obj/librolls/strdup.o


${OBJ_DIR}/librols.a: LIBROLS_OBJECTS
	ar rcs $@ $^

