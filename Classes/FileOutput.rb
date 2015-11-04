class FileOutput
	@template = nil
	@fileType = nil

	def saveMe()
		puts self.class.name
		# create a subdirectory in the Objects directory
		# subdirectory name is model name
		# write self.class.name as filename.#{@fileType}
		puts @template
	end

	def printMe()
		puts @template
	end
end