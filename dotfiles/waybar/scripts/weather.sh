#!/bin/sh
curl wttr.in/?format=1 | sed 's/ //g'
