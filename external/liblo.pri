clebsCheck(liblo) {
    win32 {
    }

    unix {
        system(pkg-config liblo):CLEBS_DEPENDENCIES *= liblo
    }
}

clebsDependency(liblo) {
    win32 {
    }

    unix {
        PKGCONFIG *= liblo
    }
}

clebsInstall(liblo) {
    win32 {
    }
}
