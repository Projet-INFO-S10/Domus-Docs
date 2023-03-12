#!/bin/bash

sendBluetoothCommand() {
  mac="$mac"
  characteristic="$characteristic"
  commandcode="$1"
  gatttool -i hci0 -b $mac --char-write-req -a $characteristic -n $commandcode
}

mac="$2"
command=$1
characteristic=0x0017

case $command in
  volume_up)
    commandcode="7efeffffff0000000000000d000101"
    ;;
  volume_down)
    commandcode="7efeffffff0000000000000d000001"
    ;;
  on)
    commandcode="7efeffffff0000000001000000000000"
    ;;
  off)
    commandcode="7efeffffff0000000001000000000001"
    ;;
  [0-9]|[1-9][0-9]|100)
    hex=$(printf '%02x\n' $1)
    commandcode="7efeffffff00000000010001000000ff$hex"
    ;;
  *)
    echo "Unsupported command!"
    exit 22
    ;;
esac

sendBluetoothCommand $commandcode
