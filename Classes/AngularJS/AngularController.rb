class AngularController < FileOutput
	@namespace = nil
	@modelName = nil

	def initialize(model, saveFile = nil)
		@namespace = model['namespace']
		@modelName = model['model']['name']
		@fileType = "js"
		saveFile ||= false
		@templateFile = model['angular-template'] ? File.expand_path("./Templates/#{model['angular-template']}", Dir.pwd) : __dir__ + "/AngularControllerTemplate.js"

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
		@template = @template.gsub! "###model-name###", @modelName
	end
end