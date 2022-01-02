require './read_input.rb'
require 'pry-byebug'

  input = ReadInput.read 'input4.txt'

  numbers = input.shift

  boards = []
  # Lets give each board a 'blank board' to store marks
  markers = []
  board = []
  input.each do |i|
    if i == ''
      boards.push board unless board.empty?
      markers.push Array.new(5) { Array.new(5) { ' ' } } unless board.empty?
      board = []
      next
    end
    board.push(i.split(' '))
  end

def completeRow(arr)
  arr.all? { |a| a == 'X' }
end

def checkForWin(marker)
  # check horizontals
  marker.each do |row|
    return true if completeRow(row)
  end
  # check verticals
  marker.transpose.each do |col|
    return true if completeRow(col)
  end
  # check diagonals (Oops, was not supposed to do this)
  # diag1 = [
  #   marker[0][0],
  #   marker[1][1],
  #   marker[2][2],
  #   marker[3][3],
  #   marker[4][4]
  # ]

  # diag2 = [
  #   marker[0][4],
  #   marker[1][3],
  #   marker[2][2],
  #   marker[3][1],
  #   marker[4][0]
  # ]
  # completeRow(diag1) || completeRow(diag2)
  return false
end

def calc_score(board, marker, num)
  sum = 0
  board.each_index do |row|
    board[row].each_index do |col|
      value = board[row][col]
      sum += value.to_i unless marker[row][col] == 'X'
    end
  end
  sum * num.to_i
end

numbers = numbers.split(',')
checked_numbers = [] # might need this
# Mark each boards 'marker', check for win
winner = nil
score = 0
numbers.each do |num|
  break unless winner.nil?

  checked_numbers << num
  boards.each_index  do |board_index|
    break unless winner.nil?

    boards[board_index].each_index do |row_index|
      break unless winner.nil?

      boards[board_index][row_index].each_index do |col_index|
        next unless boards[board_index][row_index][col_index] == num

        markers[board_index][row_index][col_index] = 'X'
        next unless checkForWin(markers[board_index])

        winner = boards[board_index]
        score = calc_score(winner, markers[board_index], num)
        break
      end
    end
  end
end
puts '-- Part One--'
puts winner.inspect
puts score
puts '***Part Two***'
#Reset inputs
boards = []
markers = []
board = []
input.each do |i|
  if i == ''
    boards.push board unless board.empty?
    markers.push Array.new(5) { Array.new(5) { ' ' } } unless board.empty?
    board = []
    next
  end
  board.push(i.split(' '))
end
# Part two is the same thing, this time, get the last board to win
winner = nil
winners_list = []
score = 0
numbers.each do |num|
  boards.each_index  do |board_index|
    catch (:next_board) do
      next if winners_list.include? board_index
      # puts "Number: #{num} Board: #{board_index}"
      boards[board_index].each_index do |row_index|
        boards[board_index][row_index].each_index do |col_index|
          next unless boards[board_index][row_index][col_index] == num
          markers[board_index][row_index][col_index] = 'X'
          next unless checkForWin(markers[board_index])
          winner = boards[board_index]
          # binding.pry if num == "94"
          score = calc_score(winner, markers[board_index], num)
          # remove this board/marker combination
          winners_list << board_index
          throw :next_board
        end
      end
    end
  end
end
binding.pry
puts winner.inspect
puts score
