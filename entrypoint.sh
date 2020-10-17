#!/bin/sh
set -e
crond -f -L /dev/stdout
