require "task_list"

RSpec.describe TaskList do
  it "initially has an empty list" do
    task_list = TaskList.new
    expect(task_list.all).to eq []
  end

  it "is initially not all complete" do
    task_list = TaskList.new
    expect(task_list.all_complete?).to eq false
  end

  # Unit test `#all` and `#all_complete?` behaviour

    it "adds tasks to a list" do
      task_list = TaskList.new
      fake_task_1 = double :task
      fake_task_2 = double :task
      task_list.add(fake_task_1)
      task_list.add(fake_task_2)
      expect(task_list.all).to eq [fake_task_1, fake_task_2]
    end
  
    it "marks tasks as complete" do
      task_list = TaskList.new
      fake_task_1 = double(:task, mark_complete: true)
      fake_task_2 = double(:task, mark_complete: true)
      task_list.add(fake_task_1)
      task_list.add(fake_task_2)
      fake_task_1.mark_complete
      fake_task_2.mark_complete
      expect(fake_task_1).to receive(:complete?).and_return(true)
      expect(fake_task_2).to receive(:complete?).and_return(true)
      expect(task_list.all_complete?).to eq true
    end
   end