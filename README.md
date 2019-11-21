# postfix_deny_plugin
is a script that if the mail sending to blocking server, u can save deferred blocked mail by this script. 

# environment:

1.linux  

2.postfix mail server that sends mail to others.it can prevent the status that has blocked IP mail resend.

# How to use:

1.this script will check if your maillog has this content:
```
550 SMTP Service deny your Ip Address.
```
2.run postfix_deny_plugin.sh by bash. 

3.check the /var/spool/postfix/deny has mail or not, done.

4.put this script in crontab.


