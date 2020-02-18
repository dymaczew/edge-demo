#!/bin/sh
source /etc/default/horizon
hzn exchange service publish -O -I -f service.definition.json -p service.policy.json -v
