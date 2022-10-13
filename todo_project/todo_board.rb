require_relative "list.rb"

class TodoBoard

    def initialize(label)
        @lists = {label => List.new(label)}
    end

    def get_command
        puts
        puts "Please enter a command:"
        command, list_label, *args = (gets.chomp).split(" ")
        list = @lists[list_label]
        case command
        when 'mklist'
            @lists[list_label] = List.new(list_label)
            return true
        when 'ls'
            puts "Current lists:"
            @lists.each {|k,v| puts k}
            return true
        when 'showall'
            @lists.each {|k,v| v.print}
            return true
        when 'mktodo'
            if args[2]
                list.add_item(args[0], args[1], args[2])
            else
                list.add_item(args[0], args[1])
            end
        when 'up'
            if args[1]
                list.up(args[0].to_i, args[1].to_i)
            else
                list.up(args[0].to_i)
            end
        when 'down'
            if args[1]
                list.down(args[0].to_i, args[1].to_i)
            else
                list.down(args[0].to_i)
            end
        when 'swap'
            list.swap(args[0].to_i, args[1].to_i)
        when 'rm'
            list.remove_item(args[0].to_i)
        when 'toggle'
            list.toggle_item(args[0].to_i)
        when 'purge'
            list.purge
        when 'sort'
            list.sort_by_date!
            return true
        when 'priority'
            list.print_priority
            return true
        when 'print'
            if args[0]
                list.print_full_item(args[0].to_i)
                return true
            else
                list.print
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
        puts "mklist <list_label>"
        puts "ls"
        puts "showall"
        puts "mktodo <list_label> <title> <deadline> <optional description>"
        puts "up <list_label> <index> <optional amount>"
        puts "down <list_label> <index> <optional amount>"
        puts "swap <list_label> <index_1> <index_2>"
        puts "rm <list_label> <index>"
        puts "toggle <list_label> <index>"
        puts "purge <list_label>"
        puts "sort <list_label>"
        puts "priority <list_label>"
        puts "print <list_label> <optional index>"
        puts "quit"
        puts "".ljust(48, "-")
    end

    def run
        while get_command
        end
    end
end