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
end