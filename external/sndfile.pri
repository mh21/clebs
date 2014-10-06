clebsCheck(sndfile) {
    win32 {
        isEmpty(SNDFILEROOT):SNDFILEROOT = $$BASEDIR/../api/sndfile

        exists($${SNDFILEROOT}):CLEBS_DEPENDENCIES *= sndfile
    }

    unix {
        system(pkg-config sndfile):CLEBS_DEPENDENCIES *= sndfile
    }
}

clebsDependency(sndfile) {
    win32 {
        INCLUDEPATH *= $${SNDFILEROOT}
        LIBS *= -L$${SNDFILEROOT} -llibsndfile-1
    }

    unix {
        PKGCONFIG *= sndfile
    }
}
