#!/usr/bin/expect -f

set timeout 30
spawn ssh aaaa@127.0.01
expect "password:"
send "xxxxx"
interact
