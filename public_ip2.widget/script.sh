#!/usr/bin/env bash

IP="$(curl -4fNs https://api.ipify.org/?format=text)"
COUNTRY="$(curl -4fNs https://ipapi.co/$IP/country/)"
echo $IP "http://www.geognos.com/api/en/countries/flag/$COUNTRY.png"