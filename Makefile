all: daemonize sleepunmounter

daemonize: daemonize.c
	cc -O2 -o $@ $<

sleepunmounter: sleepunmounter.swift
	swiftc -O -o $@ $<

