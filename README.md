# Gifthealth sample parser

Task description taken [here](https://gist.github.com/schneiderderek/a9c0a8b29bcd51f43c9fc198c6c13ece).

## Description:

This parser is designed to be easy to understand but also with some approach to extensibility as well as following SOLID/OOP approaches.

Parser takes input file containing lines of the following format:
`UserName DrugOrPrescriptionName event_name`

## Prerequisites:

* (optional) run `chmod +x bin/parser` to make file executable

## Requirements:

* ruby `3.2`
* rspec `3.11.0`

## Features:

- validates input file presence and format
- supports `.txt` extension; list of supported extensions can be updated
- code test coverage


## How to run:

Running application:
- clone this repository
- `$ cd gifthealth_parser/`
- `$ ruby bin/parser public/input.txt`
or
- `$ bin/parser public/input.txt` if `bin/parser` is made executable

## Tests

Run `rspec` to run full tests suite.

This will also generate test coverage file.

## Other

Run `$ rubucop` to run style-guide checks.
