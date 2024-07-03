#!/bin/sh
# shellcheck disable=SC2006

usage() {
	cat <<-EOF
	USAGE: ${0##*/} [enable|disable|status|check|help]

	enable:
	  Enable KVM.

	disable:
	  Disale KVM.

	status:
	  Print whether KVM is enabled or not.  Exit with the status 1 if disabled.

	check:
	  Print whether KVM is supported on this host or not.  Exit with the status 1 if unsupported.

	help:
	  Print this usage guide and exit.  This is the default behaviour if no command is specified.
	EOF
}

for s in doas sudo; do
	if type $s 2>&1 >/dev/null; then
		_sudo=$s
	fi
done

case "$1" in
	enable)
		for m in $(locate kvm | grep -E '/kvm(|-intel).ko' | grep "$(uname -r)"); do
			$_sudo insmod "$m"
		done
		;;
	disable)
		for m in $(lsmod | awk '($1 ~ /kvm/) {print $1}'); do
			$_sudo rmmod "$m"
		done
		;;
	status)
		if lsmod | grep -E 'kvm(|-intel)' > /dev/null; then
			echo "KVM is enabled"
			exit 0
		else
			echo "KVM is disabled"
			exit 1
		fi
		;;
	check)
		if [ "`grep -cE '(vmx|svm)' /proc/cpuinfo`" -gt 0 ]; then
			echo "KVM is supported"
			exit 0
		else
			echo "KVM is not supported"
		exit 1
		fi
		;;
	help|"")
		usage
		exit 0
		;;
esac
