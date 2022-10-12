class Game
    require_relative "Board"
    require_relative "HumanPlayer"
    require_relative "ComputerPlayer"

    def initialize(n, players)
        @players = player.map do |mark, computer|
            if computer
                ComputerPlayer.new(mark)
            else
                HumanPlayer.new(mark)
            end
        @current_player = @players.first
        @board = Board.new(n)

    end

    def switch_turn
        @current_player = @players.rotate!.first
    end

    def play
        while @board.empty_positions?
            @board.print
            choices = @board.legal_positions
            position = @current_player.get_position(choices)
            @board.place_mark(position, @current_player.mark)
            if @board.win?(@current_player.mark)
                puts "Victory! #{@current_player} hash won!"
                return
            else
                switch_turn
            end
        end
        
        puts "Game Over"
        puts "It is a tie"

    end



end