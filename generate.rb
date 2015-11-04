#!/usr/bin/env Ruby

require 'yaml'
require 'optparse'

def main
end

options = {}
OptionsParser.new do |opt|
    opts.banner = "Usage: generate.rb <file_type (VB, C#)> <yaml_file> [options]"
end.parse!

main()