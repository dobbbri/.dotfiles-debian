#!/bin/bash

sudo ifdown wlp2s0b1 && sudo ifup wlp2s0b1 && dunstify -a "Wifi" "wifi restated" -t 2000
