clebsCheck(liblo) {
    win32 {
        isEmpty(LIBLOROOT):LIBLOROOT = $$BASEDIR/../api/liblo
        isEmpty(LIBLOLIB):LIBLOLIB = liblo
        isEmpty(LIBLOLIB_RELEASE):LIBLOLIB_RELEASE = $${LIBLOLIB}
        isEmpty(LIBLOLIB_DEBUG):LIBLOLIB_DEBUG = $${LIBLOLIB}_d
        isEmpty(LIBLOLIBDIR):LIBLOLIBDIR = $${LIBLOROOT}/lib
        isEmpty(LIBLOLIBDIR_RELEASE):LIBLOLIBDIR_RELEASE = $${LIBLOLIBDIR}/ReleaseDLL
        isEmpty(LIBLOLIBDIR_DEBUG):LIBLOLIBDIR_DEBUG = $${LIBLOLIBDIR}/DebugDLL
        isEmpty(LIBLOINCLUDEDIR):LIBLOINCLUDEDIR = $${LIBLOROOT}

        exists($${LIBLOROOT}):CLEBS_DEPENDENCIES *= liblo
    }

    unix {
        system(pkg-config liblo):CLEBS_DEPENDENCIES *= liblo
    }
}

clebsDependency(liblo) {
    win32 {
        INCLUDEPATH *= $${LIBLOINCLUDEDIR}
        CONFIG(debug, debug|release) {
            LIBS *= -L$${LIBLOLIBDIR_DEBUG} -l$${LIBLOLIB_DEBUG}
        } else {
            LIBS *= -L$${LIBLOLIBDIR_RELEASE} -l$${LIBLOLIB_RELEASE}
        }
    }

    unix {
        PKGCONFIG *= liblo
    }
}

clebsInstall(liblo) {
    win32 {
        CONFIG(debug, debug|release) {
            libloinstall.files = $${LIBLOLIBDIR_DEBUG}/$${LIBLOLIB_DEBUG}.dll
        } else {
            libloinstall.files = $${LIBLOLIBDIR_RELEASE}/$${LIBLOLIB_RELEASE}.dll
        }
        libloinstall.path = $$BINDIR
        INSTALLS *= libloinstall
    }
}
