#!/bin/bash

nmcli | head -n 1 | awk -F ": " '{print $2}'

exit 0
