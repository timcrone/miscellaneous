#!/bin/ash
# Drops my kids' phones off the network at bed time.
# Working around that the MAC block doesn't work.
# Ironically this isn't even perfect - it just makes it
# painfully slow.  Something about iptables on this
# version of LEDE...

drop () {
  cat /proc/net/arp | grep $1 | awk '{system("/usr/sbin/iptables -I FORWARD -j DROP -d " $1)}'
  cat /proc/net/arp | grep $1 | awk '{system("/usr/sbin/iptables -I FORWARD -j DROP -s " $1)}'
}

drop "00:11:22:33:44:55" # Oldest son phone
drop "aa:bb:cc:dd:ee:ff" # Oldest daughter phone

# crontab based on the bed times we discussed - don't forget to
#  /etc/init.d/cron enable
# 
# # These repeats are really redundant, just to mitigate hardware
# # workarounds if I'm not home.  Need to remember to make sure the
# # VOIP is up in that situation.
# 30 23 * * * /usr/bin/dropkids.sh >/dev/null 2>&1
# 45 22 * * 6 /usr/bin/dropkids.sh >/dev/null 2>&1
# 0 22 * * 0-4 /usr/bin/dropkids.sh >/dev/null 2>&1
# 0 5 * * * /usr/bin/undropkids.sh >/dev/null 2>&1

