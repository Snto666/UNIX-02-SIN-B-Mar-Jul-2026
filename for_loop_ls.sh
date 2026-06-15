#!/bin/bash

# $(ls .) ejecuta el comando ls y le da la lista de archivos al bucle
for file in $( ls . ); do
    echo "File: ${file}"
done