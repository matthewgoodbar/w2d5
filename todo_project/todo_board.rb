require_relative "list.rb"

class TodoBoard

    def initialize(label)
        @list = List.new(label)
    end

    def get_command
        puts
        puts "Please enter a command:"
        command, *args = (gets.chomp).split(" ")
        case command
        when 'mktodo'
            if args[2]
                @list.add_item(args[0], args[1], args[2])
            else
                @list.add_item(args[0], args[1])
            end
        when 'up'
            if args[1]
                @list.up(args[0].to_i, args[1].to_i)
            else
                @list.up(args[0].to_i)
            end
        when 'down'
            if args[1]
                @list.down(args[0].to_i, args[1].to_i)
            else
                @list.down(args[0].to_i)
            end
        when 'swap'
            @list.swap(args[0].to_i, args[1].to_i)
        when 'sort'
            @list.sort_by_date!
            return true
        when 'priority'
            @list.print_priority
            return true
        when 'print'
            if args[0]
                @list.print_full_item(args[0].to_i)
                return true
            else
                @list.print
                return true
            end
        when 'quit'
            return false
        when 'help'
            print_help
            return true
        else
            puts "Sorry, that command is not recognized."
            puts "Type \"help\" for list of valid commands."
            return true
        end
    end

    def print_help
        puts "".ljust(48, "-")
        puts "Valid Commands"
        puts "".ljust(48, "-")
        puts "mktodo <title> <deadline> <optional description>"
        puts "up <index> <optional amount>"
        puts "down <index> <optional amount>"
        puts "swap <index_1> <index_2>"
        puts "sort"
        puts "priority"
        puts "print <optional index>"
        puts "quit"
        puts "".ljust(48, "-")
    end

    def run
        while get_command
        end
    end
end