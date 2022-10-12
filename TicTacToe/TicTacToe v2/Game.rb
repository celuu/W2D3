class Game
    require_relative "Board"
    require_relative "HumanPlayer"

    def initialize(n, *marks)
        @players = marks.map do |mark|
                    HumanPlayer.new(mark)
                    end
        @current_player = @players.first
        @board = Board.new(n)

    end

    def switch_turn
        @current_player = @players.rotate!.first
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