#!/bin/bash
for palavra in $(cat raw); do
host $palavra.$1 | grep -v "NXDOMAIN"
done
