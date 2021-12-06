require './read_input.rb'

input = ReadInput::transpose 'input3.txt'

#We want a bitmask of 1's of length 1000 (the input is 1000 lines long)
xor_bitmask = (2**1000) - 1

def calculateGammaString(inputArr)
    binStr = ""
    inputArr.each { |i|
        i.count { |n| n == "1" } > 500 ? (binStr << "1") : (binStr << "0")
    }
    binStr
end

#Yeah, not necessary to produce intermediate string, but we're having FUN here
def calculateEpsilonString(inputStr)
    bitmask = (2**inputStr.length) - 1
    ( (eval ("0b" << inputStr ) ) ^ bitmask ).to_s(2)
end



gammaString = calculateGammaString(input)
puts gammaString
epsilonString = calculateEpsilonString(gammaString)
puts epsilonString

#Mutliply the two to get part one answer
puts "Part one answer: #{(eval ("0b" << gammaString)) * (eval ("0b" << epsilonString))}"


#Part two 

oxygen = ReadInput::read_split('input3.txt')

position = 0
while oxygen.length > 1 do 
    #Go through transposed array, determine which to keep (most frequent for O2)
    transposed_array = oxygen.transpose
    transposed_array[position].count{ |x| x == "1"} >= (transposed_array[position].length/2) ? (delete = "0") : (delete = "1")
    oxygen.delete_if { |x| x[position] == delete }
    position += 1 
end

c02 = ReadInput::read_split('input3.txt')
position = 0
while c02.length > 1 do 
    transposed_array = c02.transpose
    transposed_array[position].count{ |x| x == "0"} <= (transposed_array[position].length/2) ? (delete = "1") : (delete = "0")
    c02.delete_if { |x| x[position] == delete }
    position += 1 
end

puts oxygen.flatten.join('')
puts c02.flatten.join('')
oxygen_value = eval ("0b" << oxygen.flatten.join(''))
c02_value = eval ("0b" << c02.flatten.join(''))
puts oxygen_value
puts c02_value
puts "Part two answer: #{c02_value * oxygen_value}"
