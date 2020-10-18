# Borgmatic Cron Docker conainer

* Base image: [oksapt/docker-borgmatic-container](https://github.com/oskapt/docker-borgmatic-container)

Adds cron job so it can run daily backups.

### Volumes

* `/data` for stuff to be backed up
* `/root/.ssh` ssh keys for remote repo.
* `/root/.config/borg` config directory (default directory for encrypton keys and `config.yaml`)

### Cronjob

```
0 6 * * * usr/local/bin/borgmatic -c /root/.config/borg/config.yaml create --stats 2>&1
```
