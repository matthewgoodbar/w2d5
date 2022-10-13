class Item

    attr_accessor :title, :description
    attr_reader :deadline, :done

    def self.valid_date?(date_string)
        elements = date_string.split("-")
        return false if elements[0].length != 4
        month, day = elements[1].to_i, elements[2].to_i
        return false if month < 1 || month > 12
        return false if day < 1 || day > 31
        return true
    end

    def initialize(title, deadline, description)
        @title = title
        @description = description
        @done = false
        if Item.valid_date?(deadline)
            @deadline = deadline
        else
            raise RuntimeError.new "Invalid date"
        end
    end

    def deadline=(new_deadline)
        if Item.valid_date?(new_deadline)
            @deadline = new_deadline
        else
            raise RuntimeError.new "Invalid date"
        end
    end

    def toggle
        @done = !@done
    end

end