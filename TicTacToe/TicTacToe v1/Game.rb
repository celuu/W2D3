class Game
    require_relative "Board"
    require_relative "HumanPlayer"

    def initialize(mark1, mark2)
        @player_1 = HumanPlayer.new(mark1)
        @player_2 = HumanPlayer.new(mark2)
        @current_player = @player_1
        @board = Board.new

    end

    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
    end

    def play
        while Board.empty_positions?
            Board.print
            HumanPlayer.get_position
            Board.place_mark(position, @current_player.mark)
            if Board.win?(@current_player.mark)
                puts "Victory! #{@current_player} hash won!"
            else
                switch_turn
            end
        end
        
        puts "Game Over"
        puts "It is a tie"

    end



end