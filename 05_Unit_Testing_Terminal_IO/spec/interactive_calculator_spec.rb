require 'interactive_calculator'

RSpec.describe InteractiveCalculator do
    it "Subtracts one number from another" do
        io = double :io

        expect(io).to receive(:puts).with("Hello. I will subtract two numbers").ordered
        expect(io).to receive(:puts).with("Please enter a number").ordered
        expect(io).to receive(:gets).and_return(15).ordered
        expect(io).to receive(:puts).with("Please enter another number").ordered
        expect(io).to receive(:gets).and_return(8).ordered
        expect(io).to receive(:puts).with("Here is your result:").ordered
        expect(io).to receive(:puts).with("15 - 8 = 7").ordered

        interactive_calculator = InteractiveCalculator.new(io)
        interactive_calculator.run
    end

    it "fails if first number isn't an integer" do
        io = double :io

        expect(io).to receive(:puts).with("Hello. I will subtract two numbers").ordered
        expect(io).to receive(:puts).with("Please enter a number").ordered
        expect(io).to receive(:gets).and_return(12.3).ordered

        interactive_calculator = InteractiveCalculator.new(io)
        expect { interactive_calculator.run }.to raise_error "Please enter a valid number"
    end

    it "fails if first number isn't an integer" do
        io = double :io

        expect(io).to receive(:puts).with("Hello. I will subtract two numbers").ordered
        expect(io).to receive(:puts).with("Please enter a number").ordered
        expect(io).to receive(:gets).and_return(123).ordered
        expect(io).to receive(:puts).with("Please enter another number").ordered
        expect(io).to receive(:gets).and_return("asfafaf").ordered

        interactive_calculator = InteractiveCalculator.new(io)
        expect { interactive_calculator.run }.to raise_error "Please enter a valid number"
    end
end