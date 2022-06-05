#!/bin/bash
set -e

rm -f /BLOG_V2/tmp/pids/server.pid

exec "$@"