clebsCheck(qwt6) {
    win32 {
        isEmpty(QWTROOT):QWTROOT = $$BASEDIR/../api/qwt
        isEmpty(QWTLIB):QWTLIB = qwt
        isEmpty(QWTLIB_RELEASE):QWTLIB_RELEASE = $${QWTLIB}6
        isEmpty(QWTLIB_DEBUG):QWTLIB_DEBUG = $${QWTLIB}d6
        isEmpty(QWTLIBDIR):QWTLIBDIR = $${QWTROOT}/lib
        isEmpty(QWTLIBDIR_RELEASE):QWTLIBDIR_RELEASE = $${QWTLIBDIR}
        isEmpty(QWTLIBDIR_DEBUG):QWTLIBDIR_DEBUG = $${QWTLIBDIR}
        isEmpty(QWTINCLUDEDIR):QWTINCLUDEDIR = $${QWTROOT}/src

        exists($${QWTINCLUDEDIR}):CLEBS_DEPENDENCIES *= qwt6
    }

    unix {
        isEmpty(QWTLIB):QWTLIB = qwt
        isEmpty(QWTINCLUDEDIR):QWTINCLUDEDIR = /usr/include/qwt

        exists($${QWTINCLUDEDIR}):CLEBS_DEPENDENCIES *= qwt6
    }
}

clebsDependency(qwt6) {
    win32 {
        INCLUDEPATH *= $${QWTINCLUDEDIR}
        CONFIG(debug, debug|release) {
            LIBS *= -L$${QWTLIBDIR_DEBUG} -l$${QWTLIB_DEBUG}
        } else {
            LIBS *= -L$${QWTLIBDIR_RELEASE} -l$${QWTLIB_RELEASE}
        }
        DEFINES *= QWT_DLL
    }
    unix {
        INCLUDEPATH *= $${QWTINCLUDEDIR}
        LIBS *= -l$${QWTLIB}
    }
}

clebsInstall(qwt6) {
    win32 {
        CONFIG(debug, debug|release) {
            qwtinstall.files = $${QWTLIBDIR_DEBUG}/$${QWTLIB_DEBUG}.dll
        } else {
            qwtinstall.files = $${QWTLIBDIR_RELEASE}/$${QWTLIB_RELEASE}.dll
        }
        qwtinstall.path = $$BINDIR
        INSTALLS *= qwtinstall
    }
}
