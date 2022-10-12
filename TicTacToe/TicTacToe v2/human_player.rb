class HumanPlayer

    def initialize(value)
        @mark_value = value
    end

    def mark_value
        @mark_value
    end

    def get_position
        puts "Please enter a position as 2 number with a space in between them: "
        input = gets.chomp.split(" ").map(&:to_i)
        if input.length < 2
            raise "That was invalid"
        end
    end

end