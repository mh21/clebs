clebsCheck(csc) {
    win32 {
        isEmpty(CSCOMPILER):CSCOMPILER = csc
        system($$CSCOMPILER /help > NUL):CLEBS_DEPENDENCIES *= csc
    }

    unix {
        isEmpty(CSCOMPILER):CSCOMPILER = mcs
        system($$CSCOMPILER /help > /dev/null):CLEBS_DEPENDENCIES *= csc
    }
}

clebsDependency(csc) {
    # Make qmake happy
    CONFIG -= gdb_dwarf_index embed_manifest_exe
    win32 {
        QMAKE_LINK = rem
        QMAKE_POST_LINK += @echo compiling cs sources for $(TARGET) && $$CSCOMPILER $(LFLAGS) /out:$(DESTDIR_TARGET) $(OBJECTS)
    }
    unix {
        TARGET = $${TARGET}.exe
        QMAKE_LINK = true
        QMAKE_POST_LINK += @echo compiling cs sources for $(TARGET) && $$CSCOMPILER $(LFLAGS) /out:$(TARGET) $(OBJECTS)
    }

    QMAKE_LFLAGS =
    QMAKE_LFLAGS_EXE =
    QMAKE_LFLAGS_CONSOLE =
    QMAKE_LFLAGS_DEBUG =
    QMAKE_LFLAGS_RELEASE =
    QMAKE_LFLAGS_RELEASE_WITH_DEBUGINFO =

    csc.input = CS_SOURCES
    csc.output = $$OBJECTS_DIR/${QMAKE_FILE_NAME}
    csc.commands = @$(COPY_FILE) ${QMAKE_FILE_NAME} ${QMAKE_FILE_OUT}
    csc.variable_out = OBJECTS
    QMAKE_EXTRA_COMPILERS += csc
}
