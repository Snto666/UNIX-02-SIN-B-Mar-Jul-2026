#!/bin/bash

echo "=== SISTEMA DE ATENCIÓN DE BASH ==="
echo "1. Saludar"
echo "2. Mostrar la fecha de hoy"
echo "3. Salir"
echo "==================================="

read -p "Elige una opción (1-3): " opcion

case "${opcion}" in
    1)
        echo "¡Hola! Espero que estés teniendo un gran día aprendiendo Bash."
        ;;
    2)
        echo "La fecha y hora actual del sistema es:"
        date
        ;;
    3)
        echo "Saliendo del programa... ¡Adiós!"
        ;;
    *)
        echo "Opción inválida. Por favor, elige entre 1, 2 o 3."
        ;;
esac