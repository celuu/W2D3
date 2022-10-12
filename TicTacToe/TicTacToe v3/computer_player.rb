def ComputerPlayer

    def initialize(value)
        @mark_value = value
    end

    def mark
        @mark_value 
    end

    def get_position(legal_positions)
        choice = legal_positions.sampleß
        puts "Computer #{self.mark} chose position @{choice.to_s}"
        choice
    end



end