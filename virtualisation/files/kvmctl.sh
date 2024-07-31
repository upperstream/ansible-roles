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

# Regex pattern for KVM kernel modules
pattern=
if grep -cE "`printf '^vendor_id[ \t:]+GenuineIntel$'`" /proc/cpuinfo > /dev/null; then
	pattern="$pattern|-intel"
fi
if grep -cE "`printf '^vendor_id[ \t:]+AuthenticAMD$'`" /proc/cpuinfo > /dev/null; then
	pattern="$pattern|-amd"
fi
pattern="kvm($pattern)"

# tac command or alternatives to print stdin lines in reverse order
_tac() { tac "$@"; }
if [ -f /etc/os-release ]; then
	. /etc/os-release
fi
if echo "$NAME" | grep 'BSD$' > /dev/null && `command -v tail > /dev/null`; then
	_tac() { tail -r "$@"; }
elif ! `command -v tac > /dev/null`; then
	_tac() { awk '{ line[i++] = $0} END { for (j = i - 1; j >= 0; j--) print line[j]; }' "$@"; }
fi

# sudo command or alternatives to escalate user privilege
for s in doas sudo; do
	if type $s 2>&1 >/dev/null; then
		_sudo=$s
	fi
done

case "$1" in
	enable)
		for m in `locate kvm | grep -E "/$pattern\.ko" | grep "\`uname -r\`" | _tac`; do
			$_sudo insmod "$m"
		done
		;;
	disable)
		for m in `lsmod | awk '($1 ~ /kvm/) {print $1}'`; do
			$_sudo rmmod "$m"
		done
		;;
	status)
		if lsmod | grep -E "$pattern" > /dev/null; then
			echo "KVM is enabled"
			exit 0
		else
			echo "KVM is disabled"
			exit 1
		fi
		;;
	check)
		if grep -cE '(vmx|svm)' /proc/cpuinfo > /dev/null; then
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
