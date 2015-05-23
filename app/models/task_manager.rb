class TaskManager
  def self.database
    if ENV["TASK_MANAGER_ENV"] == 'test'
      @database ||= Sequel.sqlite("db/task_manager_test.sqlite3")
    else
      @database ||= Sequel.sqlite("db/task_manager.sqlite3")
    end
  end

  def self.create(task)
    # dataset.insert(task)
    dataset.insert(:title => task[:title], :description => task[:description])
    # database.transaction do
    #   database['tasks'] ||= []
    #   database['total'] ||= 0
    #   database['total'] += 1
    #   database['tasks'] << { "id" => database['total'], "title" => task[:title], "description" => task[:description] }
    # end
  end

  # def self.raw_tasks
  #   database.transaction do
  #     database['tasks'] || []
  #   end
  # end

  def self.all
    tasks = dataset.map do |data|
      Task.new(data)
    end
    # binding.pry
    # raw_tasks.map { |data| Task.new(data) }
  end

  # def self.raw_task(id)
  #   raw_tasks.find { |task| task["id"] == id }
  # end

  def self.find(id)
    task = dataset.where(:id => id)
    Task.new(task.to_a.first)
    # Task.new(raw_task(id))
  end

  def self.update(id, data)
    dataset.where(id: id).update(data)

    # database.transaction do
    #   target = database["tasks"].find { |element| element["id"] == id }
    #   # target = {"title"=> "Homework", "descrioption"=> "study"}
    #   target["title"] = task[:title]
    #   target["description"] = task[:description]
    # end
  end

  def self.destroy(id)
    dataset.where(id: id).delete
    # database.transaction do
    #   database['tasks'].delete_if { |task| task["id"] == id }
    # end
  end

  def self.delete_all
    # binding.pry
    dataset.delete

    # database.transaction do
    #   database['tasks'] = []
    #   database['total'] = 0
    # end
  end

  def self.dataset
    database.from(:tasks)
  end
end