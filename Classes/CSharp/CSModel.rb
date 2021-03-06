class CSModel < FileOutput
	@namespace = nil
	@modelName = nil
	@properties = nil

	def initialize(model, saveFile = nil)
		@namespace = model['namespace']
		@modelName = model['model']['name']
		@fileType = "cs"
		saveFile ||= false
		@templateFile = model['model']['template'] ? File.expand_path("./Templates/#{model['model']['template']}", Dir.pwd) : __dir__ + "/ModelTemplate.cs"

		if !File.exist?(@templateFile)
			puts "File #{@templateFile} does not exist"
			exit
		end

		loadTemplate()
		buildProperties(model)
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
		@template = @template.gsub! "###properties###", @properties
	end

	# Parses 
	def buildProperties(model)
		@properties = ""
		model['properties'].each do |key, val|
			if (val.kind_of?(Array))
				val.each do |innerVal|
					@properties += "\tpublic #{key} #{innerVal} { get; set; } \r\n"
				end
			else
				@properties += "\tpublic #{key} #{val} { get; set; } \r\n"
			end
		end
	end
end