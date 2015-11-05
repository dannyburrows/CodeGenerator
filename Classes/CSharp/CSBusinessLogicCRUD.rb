class CSBusinessLogicCRUD < FileOutput
	@namespace = nil
	@modelName = nil

	def initialize(model, saveFile = nil)
		@namespace = model['namespace']
		@modelName = model['model-name']
		@fileType = "cs"
		saveFile ||= false

		loadTemplate()
		replaceVariables()

		if (saveFile)
			saveMe()
		else
			printMe()
		end
	end

	# Gets reference to the tempalte file
	def loadTemplate
		@template = File.read(__dir__ + "./CSBusinessLogicCRUDTemplate.cs")
	end

	# Replaces specific variables in template file
	def replaceVariables
		@template = @template.gsub! "###namespace###", @namespace
		@template = @template.gsub! "###model-name###", @modelName
	end
end