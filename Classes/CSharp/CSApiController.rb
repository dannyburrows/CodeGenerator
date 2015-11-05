# Builds a base api controller for the specific model
class CSApiController < FileOutput
	@namespace = nil
	@modelName = nil
	@baseApi = nil

	def initialize(model, saveFile = nil)
		@namespace = model['namespace']
		@modelName = model['model-name']
		@baseApi = model['api-controller']['baseApi']
		
		@fileType = model['file-type']
		saveFile ||= false
		@templateFile = model['api-template'] ? File.expand_path("./Templates/#{model['api-template']}", Dir.pwd) : __dir__ + "/ApiControllerTemplate.cs"
		puts @templateFile
		if !File.exist?(@templateFile)
			puts "File #{@templateFile} does not exist"
			exit
		end

		loadTemplate()
		replaceVariables()

		saveFile ?  saveMe() : printMe()
	end

	# Gets reference to the tempalte file
	def loadTemplate
		@template = File.read(@templateFile)
	end

	# Replaces specific variables in template file
	def replaceVariables
		@template = @template.gsub! "###namespace###", @namespace
		@template = @template.gsub! "###model-name###", @modelName
		@template = @template.gsub! "###baseApi###", (@baseApi.nil? ? "" : " : #{@baseApi}")
	end
end