class Game
	attr_reader :grid, :player_1, :player_2, :game_status
	#What does the game do?
	#1 It says whether or not someone has won
		#It says if there is no winner
	#2 It says who's turn it is

	def initialize
		@grid = Board.new
		@player_1 = Player.new
		@player_2 = Player.new
	end


end

class Board
	#What does a board do?
	#1 It creates the grid
	#2 It displays the grid with horizontal and vertical lines

	attr_reader :board, :empty_cell

	def initialize
		@empty_cell = "-"
		@board = Array.new(9, @empty_cell )
	end

	def display
		@board.each_with_index do |val, row_idx|
			puts " #{val} "
		end
	end

end

Player = Struct.new(:name, :sym)

# load 'tictactoe.rb'
# board = Board.new
# board.display