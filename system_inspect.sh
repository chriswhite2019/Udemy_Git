#!/bin/sh

echo "================================"
        systemctl status ntpd | head -7
echo ""
        systemctl status sshd | head -8
echo ""
        systemctl status snmpd | head -7
echo "================================"
        yum info cowsay -q | head -n -1
echo "================================"
        journalctl | tail -n 10
