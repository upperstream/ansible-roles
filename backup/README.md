# Backup role

## Summary

The `backup` role installs backup scripts to the target host, where
backups of other remote hosts will be created.  The role can also manage
the configuration file and set up a cron job to run the backup
automatically.

## How it works

The role installs two scripts to the target host:

* `backup.sh` - A wrapper script that executes the backup process and
  logs output via `logger`.  Accepts the following command-line options:
  * `-c backup.conf` / `--config=backup.conf` - Use a specified
    configuration file instead of the default
    (`{{ backup_home }}/backup.conf`)
  * `-h` / `-H` / `--help` - Show usage and exit
* `backup.awk` - The actual implementation that reads the configuration
  file and executes `rsync` commands

The `backup.sh` script is designed to be executed by cron.  It reads the
configuration file (`backup.conf`) line by line and executes `rsync` to
copy remote files to local directories.

## Prerequisites

* The `backup` user must have SSH key-based authentication configured
  for accessing remote hosts
* `rsync` must be installed on both the local (target) host and remote
  hosts
* The `backup` user on remote hosts should have appropriate privileges
  (typically via sudo) to read the files being backed up
* The `logger` command must be available on the target host for logging

## Variables

* `backup_user` - Username for the backup user.  Default: `backup`
* `backup_home` - Home directory where scripts and configuration will be
  installed.  Default: `/home/backup`
* `backup_manage_user` - If `true`, the role will create the `backup`
  group and user.  If `false` (default), the user must already exist on
  the target host.  Note that the [`base`](../base/README.md) role can
  set up a user by `users_to_create` option in more fine-grained way.
* `backup_config` - If `true`, a timestamped backup of `backup.conf` is
  created in `backup_home` before the file is modified.  The backup is
  **only created if the file will actually be changed**.  Default:
  `false`
* `backup_entries` - Optional list of backup entries.  When defined, the
  role generates `backup.conf` from a template.  Each entry is a
  dictionary with the following fields:
  * `source` - Remote source path in the format
    `hostname:/path/to/directory/` (required)
  * `dest` - Local destination path (required)
  * `ssh` - SSH command string, typically including the identity file
    (required). Example: `ssh -i /home/backup/.ssh/id_ed25519`
  * `rsync` - Optional path to the rsync binary on the remote host.  Use
    this when rsync is not in the default PATH on the remote system (e.g.,
    `/opt/homebrew/bin/rsync` on macOS with Homebrew)
* `backup_cron` - Optional dictionary to configure a cron job for the
  backup user.  When defined, a cron job will be created with the
  following fields:
  * `minute` - Minute field of the cron schedule (e.g., `"0"`, `"*/15"`,
    `"*"`)
  * `hour` - Hour field of the cron schedule (e.g., `"2"`, `"*/6"`,
    `"*"`)
  * `day` - Day of month field (e.g., `"1"`, `"*/7"`, `"*"`)
  * `month` - Month field (e.g., `"*"`, `"1,6,12"`)
  * `day_of_week` - Day of week field (e.g., `"*"`, `"0"` for Sunday,
    `"1-5"` for weekdays)
  * `config` - Optional path to a configuration file to pass via `-c` to
    `backup.sh`.  When omitted, `backup.sh` uses its default config path
    (`{{ backup_home }}/backup.conf`)

  Note that `base` role with `cron` option can set up a cron job with environment variable definitions.

## Configuration file format

The `backup.conf` file consists of tab-delimited lines with the
following fields:

1. **source** - Remote source path (e.g., `host1:/home/user1/data/`)
2. **destination** - Local destination path (e.g., `/export/backup/data/`)
3. **ssh** - SSH command (e.g., `ssh -i /home/backup/.ssh/id_ed25519`)
4. **rsync_path** - Optional remote rsync binary path (e.g.,
   `/opt/homebrew/bin/rsync`)

Lines starting with `#` are treated as comments. The `#` character can also
appear anywhere on a line to mark the rest of the line as a comment (inline
comments). Empty lines are ignored. The entire file is processed from
beginning to end.

## Example usage

### Basic usage with existing backup user

    - hosts: backup_server
      roles:
        - role: backup
          backup_entries:
            - source: "webserver:/var/www/html/"
              dest: "/export/backup/webserver/www/"
              ssh: "ssh -i /home/backup/.ssh/id_ed25519"
            - source: "database:/var/lib/postgresql/"
              dest: "/export/backup/database/postgresql/"
              ssh: "ssh -i /home/backup/.ssh/id_ed25519"
          backup_cron:
            minute: "0"
            hour: "2"
            day: "*"
            month: "*"
            weekday: "*"

### Creating the backup user

    - hosts: backup_server
      roles:
        - role: backup
          backup_manage_user: true
          backup_entries:
            - source: "host1:/home/user1/documents/"
              dest: "/export/backup/documents/"
              ssh: "ssh -i /home/backup/.ssh/id_ed25519"

### Using custom rsync path for macOS hosts

    - hosts: backup_server
      roles:
        - role: backup
          backup_entries:
            - source: "macos-host:/Users/user1/data/"
              dest: "/export/backup/macos-data/"
              ssh: "ssh -i /home/backup/.ssh/id_ed25519"
              rsync: "/opt/homebrew/bin/rsync"

### Installing scripts only (manual configuration)

If you prefer to manually manage `backup.conf`, simply omit the
`backup_entries` variable:

    - hosts: backup_server
      roles:
        - role: backup

This will install the scripts but not generate or modify `backup.conf`.

## Notes

* The role always installs `backup.sh` and `backup.awk` scripts
* The `backup.conf` file is only generated/updated when `backup_entries`
  is defined
* The cron job is only created when `backup_cron` is defined
* All rsync operations are executed with the `-auv` flags (archive,
  update, verbose)
* Backup output is logged to syslog with the tag `backup` and priority
  `user.info`
