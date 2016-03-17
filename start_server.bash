#!/bin/bash

../postgres/bin/postgres -p 15035 -D ../postgres/data/ >& logfile &
sleep 1
ps aux | grep postgres


