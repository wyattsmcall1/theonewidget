#!/usr/bin/env bash

lFan="$(./fan-bar.widget/osx-cpu-temp -f)"
cpuTemp="$(./fan-bar.widget/osx-cpu-temp -C)"
echo $lFan 
echo " "$cpuTemp
