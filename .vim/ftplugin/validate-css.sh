#!/bin/sh
curl -s -F "output=gnu" -F "file=@$1;type=text/css" "http://qa-dev.w3.org:8001/css-validator/validator"
