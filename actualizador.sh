#!/bin/bash
# -*- ENCODING: UTF-8 -*-

verRemote=$(git ls-remote| awk '{print $2}' | cut -d '/' -f 3 | cut -d '^' -f 1  | uniq|tail -1)
verLocal=$(git tag|tail -1)
echo "En el servidor: $verRemote"
echo "En local: $verLocal"

if [[ $verLocal == $verRemote ]]
then
    echo "ESTAMOS AL DIA!!"
else
    echo "HAY QUE ACTUALIZAR"
fi