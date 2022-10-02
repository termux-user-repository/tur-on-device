TERMUX_PKG_HOMEPAGE=https://www.r-project.org/
TERMUX_PKG_DESCRIPTION="A free software environment for statistical computing and graphics"
TERMUX_PKG_LICENSE="GPL-2.0, GPL-3.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=4.2.1
TERMUX_PKG_SRCURL=https://mirrors.tuna.tsinghua.edu.cn/CRAN/src/base/R-${TERMUX_PKG_VERSION::1}/R-$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=4d52db486d27848e54613d4ee977ad952ec08ce17807e1b525b10cd4436c643f
TERMUX_PKG_DEPENDS="libandroid-glob, libiconv, libbz2, libcurl, liblzma, pcre, readline, zlib"
TERMUX_PKG_BUILD_DEPENDS="binutils, gcc-11, openjdk-17"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
--with-x=no
--enable-R-shlib
"

termux_step_pre_configure() {
    CFLAGS="${CFLAGS/-Oz/-Os}"
	CXXFLAGS="${CXXFLAGS/-Oz/-Os}"
	LDFLAGS="${LDFLAGS/-static-openmp/''}"
	LDFLAGS+=" -landroid-glob"
	export JAVA_HOME=$TERMUX_PREFIX/opt/openjdk-17

	CROSS_PREFIX=$TERMUX_ARCH-linux-android
	if [ "$TERMUX_ARCH" == "arm" ]; then
		CROSS_PREFIX=arm-linux-androideabi
	fi

	export AR=$CROSS_PREFIX-ar
	export AS=$CROSS_PREFIX-as
	export LD=$CROSS_PREFIX-ld
	export NM=$CROSS_PREFIX-nm
	export CC=$CROSS_PREFIX-gcc-11
	export FC=$CROSS_PREFIX-gfortran-11
	export CXX=$CROSS_PREFIX-g++-11
	unset CPP CXXCPP STRINGS
	export STRIP=$CROSS_PREFIX-strip
	export RANLIB=$CROSS_PREFIX-ranlib
}
