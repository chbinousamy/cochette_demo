#!/usr/bin/env bats

PCAP="one_session.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none"

@test "HTTP Inspector raw_body and raw_header buffer match test" {
    $snort -c $CFG -r $PCAP $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

