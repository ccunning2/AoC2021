require './read_input.rb'

input = ReadInput::read 'input2.txt'

horiz = 0
vert = 0

input.each { |lin| 
    a = lin.split(' ')
    command = a[0]
    value = a[1].to_i
    case command
    when "forward"
        horiz += value
    when "up"
        vert -= value 
    when "down"
        vert += value
    end
}

puts "Part 1 answer is #{horiz * vert}"

#Part two begin
horiz = 0
vert = 0
aim = 0


input.each { |lin| 
    a = lin.split(' ')
    command = a[0]
    value = a[1].to_i
    case command
    when "forward"
        horiz += value
        vert += (aim * value)
    when "up"
        aim -= value 
    when "down"
        aim += value
    end
}

puts "Part 2 answer is: #{horiz * vert}"