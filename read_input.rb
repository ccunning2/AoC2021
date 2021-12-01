module ReadInput
    #Loads each line from a file into an array (removing line separator)
    def ReadInput.read(file)
        inputArr = []
        f = File.new(file)
        inputArr << f.gets.chomp until f.eof?
        inputArr
    end
    #Same as read, but parse to int
    def ReadInput.readInt(file)
        inputArr = []
        f = File.new(file)
        inputArr << f.gets.chomp.to_i until f.eof?
        inputArr
    end
end