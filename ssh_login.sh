#!/usr/bin/expect -f

set timeout 30
spawn ssh wujiang1@202.106.182.212
expect "password:"
send "s8O6AjOO+rmpmjOdWfeOtLCgncPTO88QnwUEWyaFnWY/fjyag9pM51vVj+YmNysnE\r"
interact
