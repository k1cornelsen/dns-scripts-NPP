#!/bin/bash

for palavra in $(cat raw);do

host -t cname $palavra.$1 | grep "alias for"

done

