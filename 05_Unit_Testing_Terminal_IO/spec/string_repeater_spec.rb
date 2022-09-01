require 'string_repeater'

RSpec.describe StringRepeater do
    it "Repeats a string a certain number of times based on an input" do
        io = double :io

        expect(io).to receive(:puts).with("Hello. I will repeat a string many times.").ordered
        expect(io).to receive(:puts).with("Please enter a string").ordered
        expect(io).to receive(:gets).and_return("PIZZA").ordered
        expect(io).to receive(:puts).with("Please enter a number of repeats").ordered
        expect(io).to receive(:gets).and_return(3).ordered
        expect(io).to receive(:puts).with("Here is your result:").ordered
        expect(io).to receive(:puts).with("PIZZAPIZZAPIZZA").ordered

        string_repeater = StringRepeater.new(io)
        string_repeater.run
    end

    it "Checks if first input is a valid string" do 
        io = double :io

        expect(io).to receive(:puts).with("Hello. I will repeat a string many times.").ordered
        expect(io).to receive(:puts).with("Please enter a string").ordered
        expect(io).to receive(:gets).and_return(64).ordered

        string_repeater = StringRepeater.new(io)
        expect { string_repeater.run }.to raise_error "Please enter a valid string"
    end

    it "Checks if second input is a valid number" do 
        io = double :io

        expect(io).to receive(:puts).with("Hello. I will repeat a string many times.").ordered
        expect(io).to receive(:puts).with("Please enter a string").ordered
        expect(io).to receive(:gets).and_return("PIZZA").ordered
        expect(io).to receive(:puts).with("Please enter a number of repeats").ordered
        expect(io).to receive(:gets).and_return(3.2).ordered

        string_repeater = StringRepeater.new(io)
        expect { string_repeater.run }.to raise_error "Please enter a valid number"
    end
end