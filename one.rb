require './read_input.rb'

input = ReadInput::readInt 'input1.txt'

number_larger_than_previous = 0
prev = nil
for i in 0..input.length
    current = input[i].to_i
    diff = (current - prev) unless prev.nil? 
    number_larger_than_previous += 1 if (diff && (diff > 0))
    prev = current
end
puts "Part one: #{number_larger_than_previous}"

#Part two is same as before, but this time compare values from a 3 value 'sliding window' 
number_larger_than_previous = 0
for i in 4..input.length
   window1_range = ((i-4)...(i-1))
   window2_range = ((i-3)...(i))
   number_larger_than_previous += 1 if (input[window2_range].sum > input[window1_range].sum)
end

puts "Part two: #{number_larger_than_previous}"