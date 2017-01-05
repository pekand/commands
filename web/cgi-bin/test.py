#!/usr/bin/python

# tun GUI then http://127.0.0.1:8000/cgi-bin/test.py
import commands

print 'Content-Type: text/html'
print
print '<html>'
print '<head><title>Hello from Python</title></head>'
print '<body>'
print '<h2>Hello from Python</h2>'


print commands.getstatusoutput('whoami')

print '</body></html>'

