#!/bin/bash

UPDATES=$(xbps-install -nuM | wc -l ; xbps-install -nuM | awk '{print $1}')
echo "  $UPDATES "