class CSBusinessLogicCRUD < FileOutput
	@namespace = nil
	@modelName = nil

	def initialize(model, saveFile = nil)
		@namespace = model['namespace']
		@modelName = model['model']['name']
		@fileType = "cs"
		saveFile ||= false
		@templateFile = model['businesscrud-template'] ? File.expand_path("./Templates/#{model['businesscrud-template']}", Dir.pwd) : __dir__ + "/CSBusinessLogicCRUDTemplate.cs"

		if !File.exist?(@templateFile)
			puts "File #{@templateFile} does not exist"
			exit
		end

		loadTemplate()
		replaceVariables()

		saveFile ?  saveMe() : printMe()
	end

	# Gets reference to the template file
	def loadTemplate
		@template = File.read(@templateFile)
	end

	# Replaces specific variables in template file
	def replaceVariables
		@template = @template.gsub! "###namespace###", @namespace
		@template = @template.gsub! "###model-name###", @modelName
		@template = @template.gsub! "###model-parameter###", @modelName
	end
end