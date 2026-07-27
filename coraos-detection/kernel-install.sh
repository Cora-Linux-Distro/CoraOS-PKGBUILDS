#!/bin/bash
set -euo pipefail

JSON_OUTPUT=$(coraos-kernel-detection)

if [ -z "$JSON_OUTPUT" ]; then
	echo "::error::coraos-kernel-detection produced no output"
	exit 1
fi

echo "found: $JSON_OUTPUT"


CPU_LEVEL=$(echo "$JSON_OUTPUT" | jq -r '.name')

if [ "$CPU_LEVEL" = "null" ] || [ -z "$CPU_LEVEL" ]; then
    echo "::error::Failed to parse CPU level from JSON"
    exit 1
fi

echo "Instruction set found: $CPU_LEVEL"


if [ "$CPU_LEVEL" = "x86-64-v4" ]; then
    KERNEL_PKG="linux-coraos-x86-64-v4"
	HEADER_PKG="linux-coraos-x86-64-v4-headers"
elif [ "$CPU_LEVEL" = "x86-64-v3" ]; then
    KERNEL_PKG="linux-coraos-x86-64-v3"
	HEADER_PKG="linux-coraos-x86-64-v3-headers"
elif [ "$CPU_LEVEL" = "x86-64-v2" ]; then
    KERNEL_PKG="linux-coraos-x86-64-v2"
	HEADER_PKG="linux-coraos-x86-64-v2-headers"
else
    KERNEL_PKG="linux-coraos"
	HEADER_PKG="linux-coraos-headers"
fi

echo "Installing Kernel: $KERNEL_PKG, And Headers: $HEADER_PKG"

pacman -S --noconfirm --needed "$KERNEL_PKG" "$HEADER_PKG"

echo "Kernel $KERNEL_PKG installed successfully"
