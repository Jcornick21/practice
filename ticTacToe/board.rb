=begin
the board is a grid of nine squares
I think the board can be represented by an array of 3 arrays
accessing the different rows of the board is done through indices
that are like coordinates
I need to be able to traverse the board
=end

board = [
  [1,2,3],
  [4,5,6],
  [7,8,9]
]

puts "FIRST ROW #{board[0][0]}" #should give me the first row of elements

# all these should output the elements that make up the first column
puts "#{board[0][0][0]}"
puts "#{board[0][1][0]}"
puts "#{board[0][2][0]}"

puts board.map{|row| row[0]}

