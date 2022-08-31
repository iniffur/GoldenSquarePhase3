class TaskFormatter
    def initialize(task)
        @task = task
    end
  
    def format
        return "[ ] #{@task.title}" if @task.complete? == false
        return "[x] #{@task.title}" if @task.complete? == true
    end
  end