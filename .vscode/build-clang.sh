#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 3 ]; then
    echo "Usage: build-clang.sh <c|cpp> <source-file> <output-file>"
    exit 1
fi

mode="$1"
src="$2"
out="$3"

mkdir -p "$(dirname "$out")"

case "$mode" in
    c)
        "${CC:-clang}" -Wall -Wextra -g "$src" -o "$out"
        ;;
    cpp)
        "${CXX:-clang++}" -Wall -Wextra -g "$src" -o "$out"
        ;;
    *)
        echo "Invalid mode: $mode"
        exit 1
        ;;
esac

echo "Built $out"
