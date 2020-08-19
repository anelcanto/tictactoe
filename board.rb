class Board
    attr_accessor :l
    def initialize
        @l = [1,2,3,4,5,6,7,8,9]
        draw_grid()
        
    end

    def space_free?(selection)
        spaceIndex = selection -1
        if (@l[spaceIndex] != 'X' && @l[spaceIndex] != 'O')
            return true
        end
    end
    def mark_space(selection, mark)
        spaceIndex = selection -1
        @l[spaceIndex] = mark
        draw_grid()
    end
    def draw_grid
        puts "\n #{@l[0]} | #{@l[1]} | #{@l[2]}"
        puts middle_lines = "–––|–—–|——–"
        puts " #{@l[3]} | #{@l[4]} | #{@l[5]}"
        puts middle_lines
        puts " #{@l[6]} | #{@l[7]} | #{@l[8]}\n\n"
    end

    def enough_space?
        return @l.any? {|i| i.is_a?(Integer)}
    end

    def win_test?(mark)
        winning_lines = []
        winning_lines[0] = [0,1,2]
        winning_lines[1] = [3,4,5]
        winning_lines[2] = [6,7,8]
        winning_lines[3] = [0,3,6]
        winning_lines[4] = [1,4,7]
        winning_lines[5] = [2,5,8]
        winning_lines[6] = [0,4,8]
        winning_lines[7] = [2,4,6]

        for i in winning_lines do
            if ( @l[i[0]] == mark && @l[i[1]] == mark && @l[i[2]] == mark)
                return true
            end
        end
    end

end
