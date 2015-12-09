clebsCheck(zlib) {
    win32 {
        isEmpty(ZLIBROOT):ZLIBROOT = $$BASEDIR/../api/zlib
        isEmpty(ZLIBINCLUDEDIR):ZLIBINCLUDEDIR = $${ZLIBROOT}
        isEmpty(ZLIBBINDIR):ZLIBBINDIR = $${ZLIBROOT}/bin
        isEmpty(ZLIBLIB):ZLIBLIB = zlib1

        exists($${ZLIBINCLUDEDIR}):CLEBS_DEPENDENCIES *= zlib
    }

    unix {
        isEmpty(ZLIBINCLUDEDIR):ZLIBINCLUDEDIR = /usr/include

        exists($${ZLIBINCLUDEDIR}/zlib.h):CLEBS_DEPENDENCIES *= zlib
    }
}

clebsDependency(zlib) {
    win32 {
        # Zlib(included with Qt, we only need the header)
        INCLUDEPATH *= $${ZLIBINCLUDEDIR}
    }
    unix {
        LIBS *= -lz
        INCLUDEPATH *= $${ZLIBINCLUDEDIR}
    }
}

clebsInstall(zlib) {
    win32 {
        zlibinstall.files = $${ZLIBBINDIR}/$${ZLIBLIB}.dll
        zlibinstall.path = $$BINDIR
        INSTALLS *= zlibinstall
    }
}
