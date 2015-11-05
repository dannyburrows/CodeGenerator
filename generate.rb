#!/usr/bin/env ruby

require 'yaml'
require 'optparse'
Dir[File.dirname(__FILE__) + '/Classes/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/Classes/**/*.rb'].each {|file| require file }

options = {}

optparse = OptionParser.new do |opts|
    opts.banner = "Stuff"

    opts.on("-a", "--api", "Create the api controller") do |yamlFile|
        options[:api] = yamlFile
    end

    opts.on("-c", "--crud", "Create the businessLogic CRUD") do |yamlFile|
        options[:crud] = yamlFile
    end

    opts.on("-d", "--datacontract", "Include datacontracts on basic tables") do |yamlFile|
        options[:datacontract] = yamlFile
    end

    opts.on("-e", "--echo", "Display the entire file contents instead of saving") do |yamlFile|
        options[:echo] = yamlFile
    end

    opts.on("-f", "--file-type FILE_TYPE", "Type of object file to generate") do |fileType|
        options[:file_type] = fileType
    end

    opts.on("-g", "--triggers", "Include triggers on basic tables") do |yamlFile|
        options[:triggers] = yamlFile
    end

    opts.on("-m", "--mvc", "Create the mvc controller") do |yamlFile|
        options[:mvc] = yamlFile
    end

    opts.on("-p", "--stored-procedure", "Include all basic stored procedures") do |yamlFile|
        options[:stored_procedure] = yamlFile
    end

    opts.on("-s", "--scaffold", "Scaffold all supporting file types") do |scaffold|
        options[:scaffold] = scaffold
    end

    opts.on("-t", "--tables", "Include the basic table") do |yamlFile|
        options[:aptablesi] = yamlFile
    end

    opts.on("-u", "--audits", "Include audit table for basic table") do |yamlFile|
        options[:audits] = yamlFile
    end

    opts.on("-v", "--servicecontract", "Include service contract") do |yamlFile|
        options[:servicecontract] = yamlFile
    end

    opts.on("-y", "--yaml YAML_FILE", "YAML file to parse") do |yamlFile|
        options[:yaml_file] = yamlFile
    end

end

optparse.parse!

def Main(options)
    yamlObject = YAML::load_file(options[:yaml_file])
    fileType = yamlObject['file-type'] || options[:file_type]
    saveFiles = options[:echo].nil?
    if (["cs", "csharp", "c\#"].include?(fileType.downcase))
        CreateCSharp(yamlObject, options, saveFiles)
    elsif (["vb", "vb.net", "visual basic"].include?(fileType.downcase))
        CreateVB(yamlObject, option, saveFiles)
    end
end

def CreateCSharp(yamlObject, options, saveFiles)
    if (options.has_key?("crud".to_sym) || options.has_key?("scaffold".to_sym) || !yamlObject['business-crud'])
        CSBusinessLogicCRUD.new(yamlObject, saveFiles)
    end

    if (options.has_key?("api".to_sym) || options.has_key?("scaffold".to_sym) || yamlObject['api-controller']['include'])
        CSApiController.new(yamlObject, saveFiles)
    end

    if (options.has_key?("mvc".to_sym) || options.has_key?("scaffold".to_sym) || yamlObject['mvc-controller']['include'])
        CSMvcController.new(yamlObject, saveFiles)
    end
end

def CreateVB(yamlObject, options, saveFiles)
end

def CreateAngular()
end

Main(options)