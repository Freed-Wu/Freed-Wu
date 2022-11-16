# shellcheck shell=bash disable=SC2034
JAVA_HOME="$(command ls -d /usr/lib/jvm/java-*-openjdk 2>/dev/null || return 0)"

if [ "${TERMUX_PACKAGES_OFFLINE-false}" = false ]; then
	if [ -d /opt/android-sdk ]; then
		ANDROID_HOME=/opt/android-sdk
	fi
	if [ -d /opt/android-ndk ]; then
		NDK=/opt/android-ndk
	fi
fi
