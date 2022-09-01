class InteractiveCalculator
    def initialize(io)
        @io = io
    end

    def run
        @io.puts "Hello. I will subtract two numbers"
        @io.puts "Please enter a number"
        num1 = gets_num
        @io.puts "Please enter another number"
        num2 = gets_num
        @io.puts "Here is your result:"
        result = (num1 - num2).to_i
        @io.puts "#{num1} - #{num2} = #{result}"
    end

    def gets_num
        input = @io.gets
        if input.is_a? Integer
            return input.to_i
        else
            fail "Please enter a valid number"
        end
    end
end

##why to_f doesnt work??

