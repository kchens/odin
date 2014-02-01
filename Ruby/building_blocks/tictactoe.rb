class TicTacToe

  def initialize(board)
    @board = []
    9.times { @board << " "}
    @turn = 0 

    winsAcrossMiddle = [ [0, 4, 8], [3, 4, 5], [1, 4, 7], [2, 4, 6]]
    winsOnEdges = [ [0, 1, 2], [0, 3, 6], [6, 7, 8], [2, 5, 8] ]
    @@winCases = winsAcrossMiddle + winsOnEdges

    puts "Tic Tac Toe!  Call playGame(number of players, who is first)"
  end

  def board
  	@board.join
  end

  def turn
    @turn  % 2 == 0 ? "X" : "O"
  end

  def boardNotFull?
  	return @board.include?(" ")
  end

  def whoStarts(startWith)
  	if startWith == "none"
  	  @turn = rand(2) + 1
  	else
  	  @turn = (startWith.upcase == "X") ? 2 : 1
  	end
  	return turn
  end

  def emptySpots
    result = ""
    @board.each_index { |i| result += (i+1).to_s+ ", " if @board[i] == " " }
    return result
  end
  
  def showBoard
    puts  
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts "------------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]}"
    ptus "------------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]}"
    puts
  end

  def play(startWith = "none")
    print "According to coin toss, " if startWith == "none"
    puts "first player will be " + whoStarts(startWith)

    winCase = false
    while winCase == false && boardNotFull?
      next_turn
      winCase = someoneWin? 
    end
    showBoard
    puts "Nobody won!" if !winCase && boardNotFull? == false
  end

  def someoneWin?
    player = nil
    @@winCases.each { |a| 
      player == @board[a[0]]
      if (player != " ") && (@board[a[0]] == @board[a[1]]) && (@board[a[1]] == @board[a[2]])
      	(0..2).each { |n| @board[a[n]].upcase! }
      	puts "We have a WINNER! ----> " + player
      	return player
      end
      }
      return false
  end

  def next_turn
  	who = turn
  	showBoard
  	print who + "'s turn. "

  	print "Choose from " + emptySpots + " :"

  	choice = ""
  	while choice == "" do
  	  choice = gets.chomp.to_i
  	  if @board[choice - 1] != " "
  	  	puts "There is already a #{@board[choice -1]} there!, choose another: "
  	  	choice = ""
  	  end
  	end

  	@board[choice - 1] = turn.downcase
  	@turn += 1
  end

end

#2 players - one X, one O
#TicTacToe
#board - 3 by 3 array
#checking victory