#!/usr/bin/env nextflow

params.geeting = 'Hello world!'
greeting_ch = Channel.from(params.greeting)

process splitletters {
	input:
	val x from greeting_ch
	
	output:
	file 'chunk_*' into letters
	
	"""
	printf '$x' | split -b 6 - chunk_
	"""
}
