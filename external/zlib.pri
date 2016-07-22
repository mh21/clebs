clebsCheck(zlib) {
    win32 {
        isEmpty(ZLIBROOT):ZLIBROOT = $$BASEDIR/../api/zlib
        isEmpty(ZLIBINCLUDEDIR):ZLIBINCLUDEDIR = $${ZLIBROOT}
        isEmpty(ZLIBBINDIR):ZLIBBINDIR = $${ZLIBROOT}/bin
        isEmpty(ZLIBLIB):ZLIBLIB = zlib1

        exists($${ZLIBINCLUDEDIR}):CLEBS_DEPENDENCIES *= zlib
    }

    unix {
        system(pkg-config zlib):CLEBS_DEPENDENCIES *= zlib
    }
}

clebsDependency(zlib) {
    win32 {
        LIBS *= -l$${ZLIBLIB}
        INCLUDEPATH *= $${ZLIBINCLUDEDIR}
    }
    unix {
        PKGCONFIG *= zlib
    }
}

clebsInstall(zlib) {
    win32 {
        zlibinstall.files = $${ZLIBBINDIR}/$${ZLIBLIB}.dll
        zlibinstall.path = $$BINDIR
        INSTALLS *= zlibinstall
    }
}
