#!/usr/bin/env awk -f
BEGIN {
	FS="\t"
}
/^[ \t]*#/ { next }
{
	sub(/[ \t]*#.*$/, "", $0)
	source=$1;
	dest=$2;
	ssh=$3;
	rsync=$4
	if (length(source) == 0) {
		next;
	}
	if (length(rsync) > 0) {
		command=sprintf("rsync -auv --rsync-path='%s' -e '%s' %s %s", rsync, ssh, source, dest);
	}
	else {
		command=sprintf("rsync -auv -e '%s' %s %s", ssh, source, dest);
	}
	printf("source=\"%s\", dest=\"%s\", ssh=\"%s\", rsync=\"%s\"\n", source, dest, ssh, rsync);
	printf("command=\"%s\"\n", command);
	system(command);
}
