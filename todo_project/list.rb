require_relative "item.rb"

class List

    PRINT_LINE = 56

    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description="")
        begin
            item = Item.new(title, deadline, description)
            @items << item
            return true
        rescue => exception
            return false
        end
    end

    def size
        return @items.length
    end

    def valid_index?(index)
        return false if index < 0 || index >= self.size
        return true
    end

    def swap(index_1, index_2)
        return false unless valid_index?(index_1) && valid_index?(index_2)
        @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
        return true
    end

    def toggle_item(index)
        return false unless valid_index?(index)
        self[index].toggle
        return true
    end

    def remove_item(index)
        return false unless valid_index?(index)
        @items.reject!.with_index {|item, i| i == index}
        return true
    end

    def purge
        @items.reject! {|item| item.done}
        return true
    end

    def [](index)
        return nil unless valid_index?(index)
        return @items[index]
    end

    def priority
        return self[0]
    end

    def print
        puts "".ljust(PRINT_LINE, "-")
        puts "".ljust(20) + self.label.upcase
        puts "".ljust(PRINT_LINE, "-")
        puts "Index " + "| Item".ljust(30) + "| Deadline".ljust(13) + "| Done?"
        puts "".ljust(PRINT_LINE, "-")
        @items.each_with_index do |item, i|
            puts "#{i}".ljust(6) + "| #{item.title}".ljust(30) + "| #{item.deadline} " + "| #{item.done ? "[X]" : "[ ]"}"
        end
        puts "".ljust(PRINT_LINE, "-")
    end

    def print_full_item(index)
        return unless valid_index?(index)
        item = self[index]
        puts "".ljust(PRINT_LINE, "-")
        puts "#{item.title}".ljust(PRINT_LINE-14) + "#{item.deadline} #{item.done ? "[X]" : "[ ]"}"
        puts "#{item.description}".ljust(PRINT_LINE) if item.description != ""
        puts "".ljust(PRINT_LINE, "-")
    end

    def print_priority
        print_full_item(0)
    end

    def up(index, amount=1)
        return false unless valid_index?(index)
        amount.times do
            self.swap(index, index-1)
            index -= 1
        end
        return true
    end

    def down(index, amount=1)
        return false unless valid_index?(index)
        amount.times do
            self.swap(index, index+1)
            index += 1
        end
        return true
    end

    def sort_by_date!
        @items.sort_by! {|item| item.deadline}
    end

end