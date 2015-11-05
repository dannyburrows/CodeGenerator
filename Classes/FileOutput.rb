require 'fileutils'

# This class handles displaying of the template or writing of the template to a file, creating directory structure as needed
class FileOutput
	@template = nil
	@fileType = nil

	def saveMe()
		modelName = self.class.name
		objectsPath = File.expand_path("./Objects", Dir.pwd)
		if (!Dir.exist?(objectsPath))
			FileUtils.mkpath(objectsPath)
		end

		# create a subdirectory in the Objects directory
		# subdirectory name is model name
		modelDirectory = File.expand_path("./#{@modelName}", objectsPath)
		if (!Dir.exist?(modelDirectory))
			FileUtils.mkpath(modelDirectory)
		end
		# write self.class.name as filename.#{@fileType}
		File.open("#{modelDirectory}/#{@modelName}.#{@fileType}", 'w') { |file| file.write(@template)}
	end

	def printMe()
		puts @template
	end
end