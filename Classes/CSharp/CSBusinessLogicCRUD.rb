class CSBusinessLogicCRUD < FileOutput
	@namespace = nil
	@modelName = nil
	@templateFile = nil

	def initialize(model, templateFile, saveFile = nil)
		@namespace = model['namespace']
		@modelName = model['model-name']
		@fileType = "cs"
		saveFile ||= false
		@templateFile = templateFile || __dir__ + "/CSBusinessLogicCRUDTemplate.cs"
		if !File.exist?(@templateFile)
			puts "File #{@templateFile} does not exist"
			exit
		end

		loadTemplate()
		replaceVariables()

		if (saveFile)
			saveMe()
		else
			printMe()
		end
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