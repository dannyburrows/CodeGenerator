#!/usr/bin/env ruby

require 'yaml'
require 'optparse'
Dir[File.dirname(__FILE__) + '/Classes/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/Classes/**/*.rb'].each {|file| require file }

options = {}

optparse = OptionParser.new do |opts|
    opts.banner = "Stuff"

    opts.on("-f", "--file-type FILE_TYPE", "Type of object file to generate") do |fileType|
        options[:file_type] = fileType
    end

    opts.on("-y", "--yaml YAML_FILE", "YAML file to parse") do |yamlFile|
        options[:yaml_file] = yamlFile
    end

    opts.on("-s", "--scaffold", "Scaffold all supporting file types") do |scaffold|
        options[:scaffold] = scaffold
    end
end

optparse.parse!

def main(options)
    yamlfile = YAML::load_file(options[:yaml_file])

    item = ApiController.new(yamlfile, true)
end

main(options)