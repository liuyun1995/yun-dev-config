#!/bin/bash

SHELL_FOLDER=$(dirname $(readlink -f "$0"))

awk -f $SHELL_FOLDER/create_table.awk $1
