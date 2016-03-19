#!/bin/bash
../postgres/bin/pg_resetxlog /tmp/postgres/data/
../postgres/bin/postgres -p 15035 -D /tmp/postgres/data/ >& logfile &
sleep 1
ps aux | grep postgres


