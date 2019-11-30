#!/usr/bin/env bats

PCAP="log_pcap.pcap"
CFG="snort.lua"
OPTIONS="-l . -U -H -q -k none"

@test "log_pcap Logger - log packets in pcap format" {
    $snort -r $PCAP -c $CFG $OPTIONS
    $snorty_path/bin/u2spewfoo unified2.log > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out log.pcap.* alert_full.txt unified2.log log_codecs.txt
}

