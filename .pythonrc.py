#!/usr/bin/env python

# Useful things to have
from __future__ import division
from math import *
import sys, os, re, math

# Readline completion of everything :)
import rlcompleter, readline, atexit
defaultCompleter = rlcompleter.Completer()

historyPath = os.path.expanduser("~/.pyhistory")

def myCompleter(text, state):
	if text.strip() == "":
		if state == 0:
			return text + "\t"
		else:
			return None
	else:
		return defaultCompleter.complete(text, state)

def save_history(historyPath=historyPath):
    import readline
    readline.write_history_file(historyPath)

readline.set_completer(myCompleter)
readline.parse_and_bind("tab: complete")

if os.path.exists(historyPath):
    readline.read_history_file(historyPath)

atexit.register(save_history)

del rlcompleter, readline, atexit

