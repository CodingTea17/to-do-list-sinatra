class Task
  attr_reader(:description, :list_id, :due_date)

  def initialize(attributes)
    @description = attributes.fetch(:description)
    @list_id = attributes.fetch(:list_id)
    @due_date = attributes.fetch(:due_date)
  end

  def self.all
    returned_tasks = DB.exec("SELECT * FROM tasks;") #order by id 
    tasks = []
    returned_tasks.each() do |task|
      description = task.fetch("description")
      due_date = task.fetch("due_date")
      list_id = task.fetch("list_id").to_i() # The information comes out of the database as a string and gets converted into interger
      tasks.push(Task.new({:description => description, :due_date => due_date, :list_id => list_id}))
    end
    tasks #line 17 into this
  end

  def save                         #SQL                                           the instances of initialize
    DB.exec("INSERT INTO tasks (description, due_date, list_id) VALUES ('#{@description}', '#{@due_date}' ,#{@list_id});")
  end #tells the database to push data into the database

  def ==(another_task) #comparing whats inside the mark 1 and mark 2
    self.description.==(another_task.description) and self.list_id.==(another_task.list_id) and self.due_date.==(another_task.due_date)
  end

  def self.all_order
    returned_tasks = DB.exec("SELECT * FROM tasks ORDER BY due_date;") #order by date
    tasks = []
    returned_tasks.each() do |task|
      description = task.fetch("description")
      due_date = task.fetch("due_date")
      list_id = task.fetch("list_id").to_i() # The information comes out of the database as a string.
      tasks.push(Task.new({:description => description, :due_date => due_date, :list_id => list_id}))
    end
    tasks
  end
end
