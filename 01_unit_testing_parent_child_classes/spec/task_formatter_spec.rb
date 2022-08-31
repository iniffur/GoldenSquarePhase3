require "task_formatter"

RSpec.describe TaskFormatter do
    it "returns task format if task is incomplete" do
        fake_task = double(:fake_task, title: "Wash the dog", complete?: false)
        task_formatter = TaskFormatter.new(fake_task)
        expect(task_formatter.format).to eq "[ ] Wash the dog"
    end

    it "returns task format if task is complete" do
        fake_task = double(:fake_task, title: "Wash the car", complete?: true)
        task_formatter = TaskFormatter.new(fake_task)
        expect(task_formatter.format).to eq "[x] Wash the car"
    end
end