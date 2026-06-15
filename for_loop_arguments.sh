#!/bin/bash

# "$@" representa la lista de todos los argumentos que le pases al script
for ip_address in "$@"; do
    echo "Taking some action on IP address ${ip_address}"
done