# Builds a base api controller for the specific model
class CSApiController < FileOutput
	@namespace = nil
	@modelName = nil
	@baseApi = nil

	def initialize(model, saveFile = nil)
		@namespace = model['namespace']
		@modelName = model['model-name']
		@baseApi = model['api-controller']['baseApi']
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
		@template = File.read(__dir__ + "./ApiControllerBase.cs")
	end

	# Replaces specific variables in template file
	def replaceVariables
		@template = @template.gsub! "###namespace###", @namespace
		@template = @template.gsub! "###model-name###", @modelName
		@template = @template.gsub! "###baseApi###", (@baseApi.nil? ? "" : " : #{@baseApi}")
	end
end