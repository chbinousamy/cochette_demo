#!/usr/bin/env bats

PCAP="modbus_w_pafs.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none"

@test "MODBUS inspector using PAF" {
    $snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

