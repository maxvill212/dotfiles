#!/bin/sh
sensors | grep edge | awk '{ print $2 }' | awk '{print substr($1,2); }'
