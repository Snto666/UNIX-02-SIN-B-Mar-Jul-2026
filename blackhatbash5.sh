#!/bin/bash
touch test && touch test123
(ls; ps)
ls; ps; whoami
lzl || echo "el comando lzl fallo "

echo "uno" > archivo.txt
cat archivo.txt

echo "uno-uno" > archivo.txt
cat archivo.txt

echo "uno-uno-dos" >> archivo.txt
cat archivo.txt

echo "tres" &> archivo.txt
cat archivo.txt
echo "tres" &>> archivo.txt
cat archivo.txt

