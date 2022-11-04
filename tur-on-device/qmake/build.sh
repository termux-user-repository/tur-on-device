TERMUX_PKG_HOMEPAGE=https://www.qt.io/
TERMUX_PKG_DESCRIPTION="A cross-platform application and UI framework"
TERMUX_PKG_LICENSE="LGPL-3.0"
TERMUX_PKG_MAINTAINER="@termux-user-repository"
TERMUX_PKG_VERSION=5.15.5
TERMUX_PKG_SRCURL="https://raw.githubusercontent.com/UtermuxBlog/termux-qt5-backup/qt5-qtbase/termux-packages_master_x11-packages_qt5-qtbase.zip"
TERMUX_PKG_SHA256=d4e75bda300b3f3be26af71a63ebc3ba6262ac2882fd3e6218711c9c0d77fe92
TERMUX_PKG_DEPENDS="dbus, double-conversion, harfbuzz, libandroid-shmem, libandroid-sysv-semaphore, libc++, libice, libicu, libjpeg-turbo, libpng, libsm, libuuid, libx11, libxcb, libxi, libxkbcommon, openssl, pcre2, ttf-dejavu, freetype, xcb-util-image, xcb-util-keysyms, xcb-util-renderutil, xcb-util-wm, zlib, glib"
# gtk3 dependency is a run-time dependency only for the gtk platformtheme subpackage
TERMUX_PKG_BUILD_DEPENDS="gtk3"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_NO_STATICSPLIT=true

termux_step_make() {
	pwd
	ls
	cd ${TERMUX_PKG_SRCDIR}/x11-packages/qt5-qtbase
	chmod 777 *
	./termux-build-qmake.sh
}
