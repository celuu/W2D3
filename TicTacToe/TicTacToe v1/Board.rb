class Grid
    def initialize
        @grid = Array.new(3){Array.new(3, "_")}
    end

    def [](position)
        row, column = position
        @grid[row][column]
    end

    def []=(position, value)
        row, column = position
        @grid[row][column] = value
    end

    def valid?(position)
        if row < 0 || row > 2
            return false
        end
        if column < 0 || column > 2
            return false
        end
        true
    end

    def empty?(position)
        @grid[position] == "_"
    end

    def place_mark(position, mark)
        if valid?(position) && empty?(position)
            @grid[position] = mark
        else
            raise "The position is invalid or it already has been chosen"
        end
    end

    def print()
        @grid.each do |row|
            puts row.join (" ")
        end
    end

    def win_row?(mark)
        @grid.each do |row|
            if row != mark
                return false
            end
        end
        true
    end

    def win_col?(mark)
        @grid.transpose.each do |col|
            if col != mark
                return false
            end
        end
        true
    end

    def win_diagonal?(mark)
        first_diagonal = (0...@grid.length).all? do |i|
            @grid[i, i] == mark
        end 

        second_diagonal = (0...@grid.length).all? do |i|
            row = i
            col = @grid.length - 1 - i
            @grid[row, col] == mark
        end

        first_diagonal || second_diagonal
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        arr = []
        (0...@grid.length).each do |i|
            arr << i
        end
        positions = arr.product(arr)
        positions.any? do |position|
            empty?(position)
        end
    end
end