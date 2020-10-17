FROM monachus/borgmatic

# Borgmatic volumes to mount
VOLUME /data
VOLUME /root/.ssh
VOLUME /root/.config/borg

RUN apk update && apk add --no-cache tzdata dcron  && rm -rf /var/cache/apk/*

#Copy borgmatic-cron to the cron.d dir.
COPY borgmatic-cron /etc/cron.d/borgmatic-cron

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/borgmatic-cron

# Apply cron job
RUN crontab /etc/cron.d/borgmatic-cron

# Create the log file to be able to run tail
#RUN touch /var/log/cron.log
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
# Run cron and show cron log output
ENTRYPOINT ["/entrypoint.sh"] 
