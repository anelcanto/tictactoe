require_relative 'board'
require_relative 'player'

class Game
    def initialize()
        @board = Board.new();
        @x_player = Player.new('X')
        @o_player = Player.new('O')
        @currentPlayer = @x_player
        @win = false

        until @win || @tie
            play()
        end
    end

    def play()
        request_mark()
        win?()
        switch_player()
    end

     def request_mark()
        if(enough_room?()==false)
            @tie = true
            puts "Tie"
        end
        mark = @currentPlayer.mark
        space = @currentPlayer.select_space
        if @board.space_free?(space) 
            @board.mark_space(space, mark)
        end
    end
    
    private def switch_player
        if (@currentPlayer== @x_player)
            @currentPlayer = @o_player
        else 
            @currentPlayer = @x_player
        end
    end

    private def win?()
        mark = @currentPlayer.mark()
        if (@board.win_test?(mark)==true)
            puts "#{mark} WINS!!!
            "
            @win = true
            return true
        end
    end

    private def mark_space(selection, mark)
        spaceIndex = selection -1
        @l[spaceIndex] = mark
        draw_grid()
    end

    private def enough_room?
        return @board.enough_space?
    end
end