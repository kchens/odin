class Game
	attr_accessor :grid, :player_1, :player_2, :game_status
	#What does the game do?
	#1 It says whether or not someone has won
		#It says if there is no winner
	#2 It says who's turn it is

	def initialize
		@grid = Board.new
		@player_1 = Player.new
		@player_2 = Player.new
		@game_status = true #true means game is still playing
		assign_players
	end

	def assign_players
		puts "What is Player 1's name?"
		@player_1.name = gets.chomp
		@player_1.sym =  "X"
		puts "Hi #{@player_1.name}, you'll be '#{@player_1.sym}'"

		puts "What is Player 2's name?"
		@player_2.name = gets.chomp
		@player_2.sym =  "O"
		puts "Hi #{@player_2.name}, you'll be '#{@player_2.sym}'"

		puts "Time to start the game!"
	end

	def play
		for count in 1..9
			turn
			get_move
		end
	end

	def turn
		if count % 2 != 0
			puts "You're turn 'X'"
		else
			puts "You're turn 'O'"
		end
	end

	def get_move(move = gets.chomp)
		mapping(move) 
	end

	# def set_move(get_move)

	# end

  def mapping(move)
    map = Hash.new
    1.upto(9) { |n| map[n] = nil }

    coord = []
    0.upto(2) do |y|
      0.upto(2) do |x|       
        coord << [ y, x]
      end
    end

    map.each { |k , v| map[k] = coord.delete_at(0) }

    map[move]
  end

end

class Board
	#What does a board do?
	#1 It creates the grid
	#2 It displays the grid with horizontal and vertical lines

	attr_accessor :board, :empty_cell

	def initialize
		@empty_cell = "-"
		@board = Array.new(3) { Array.new(3, @empty_cell) }
	end

	def display
		@board.each_with_index do |y, y_idx|
			y.each_with_index |x, x_idx|
				print 
			end
		end
	end

end

Player = Struct.new(:name, :sym)

# load 'tictactoe.rb'
# board = Board.new
# board.display