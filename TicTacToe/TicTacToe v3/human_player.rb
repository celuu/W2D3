class HumanPlayer

    def initialize(value)
        @mark_value = value
    end

    def mark_value
        @mark_value
    end

    def get_position(legal_positions)
        position = nil
        until legal_positions(position)
            puts "Please enter a position as 2 number with a space in between them: "
            input = gets.chomp.split(" ").map(&:to_i)
            if !legal_positions.include?(input) || position.length < 2
                raise "That was illegal, please try again"
            end
        end
    end

end