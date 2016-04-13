#!/bin/bash
pgbin=~/public/826-proj/postgres/bin

$pgbin/pg_resetxlog /tmp/postgres/data/
$pgbin/postgres -p 15035 -D /tmp/postgres/data/ >& logfile &
sleep 1
ps aux | grep postgres


