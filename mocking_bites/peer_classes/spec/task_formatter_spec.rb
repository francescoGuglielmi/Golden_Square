require "task_formatter"

describe TaskFormatter do
  it "returns the task format when task is complete" do
    task = double :fake_task, title: "washing up", complete: false
    task_formatter = TaskFormatter.new(task)
    expect(task_formatter.format).to eq "- [ ] washing up"
  end

  it "returns the task format when task is incomplete" do
    task = double :fake_task, title: "washing up", complete: true
    task_formatter = TaskFormatter.new(task)
    expect(task_formatter.format).to eq "- [x] washing up"
  end
end