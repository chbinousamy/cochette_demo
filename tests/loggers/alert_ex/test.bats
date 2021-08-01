#!/usr/bin/env bats

PCAP="alert_ex.pcap"
CFG="snort.lua"
OPTIONS="--plugin-path $SNORT_PLUGINS -A alert_ex -q"

@test "alert_ex Logger - output event in alert_ex format" {
    [ -f $SNORT_PLUGINS/extra/loggers/alert_ex.so ] # is plugin installed?
    $snort -r $PCAP -c $CFG $OPTIONS > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}
