#!/bin/sh
echo "load(augmented_lagrangian);FOM:$1;augmented_lagrangian_method(FOM, [$2], [$3], [$4]);" | maxima