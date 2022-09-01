class StringRepeater
    def initialize(io)
        @io = io
    end
    
    def run
        @io.puts "Hello. I will repeat a string many times."
        @io.puts "Please enter a string"
        string_input = get_string
        @io.puts "Please enter a number of repeats"
        repeats_input = get_repeats
        repeated_string = string_input * repeats_input
        @io.puts "Here is your result:"
        @io.puts "#{repeated_string}"
    end

    def get_string
        input = @io.gets
        return input if input.is_a? String
        fail "Please enter a valid string"
    end

    def get_repeats
        input = @io.gets
        return input.to_i if input.is_a? Integer
        fail "Please enter a valid number"
    end
end

# string_repeater = StringRepeater.new(Kernel)
# string_repeater.run
