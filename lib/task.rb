class Task
  # @@tasks = []
  define_method(:initialize) do |name|
    @name = name
    save()
  end

  define_method(:name) do
     @name
  end

  define_singleton_method(:all) do
    returned_tasks = DB.exec("SELECT * FROM task;")
    tasks = []
    returned_tasks.each() do |one_rec|
      returned_name = one_rec.fetch("name")
      new_task = Task.new(returned_name)
      tasks.push(new_task)
    end
    tasks
  end

  define_singleton_method(:clear) do
    @@tasks = []
  end

  define_method(:save) do
    @@tasks.push(self)
  end

  define_method(:==) do |twin|
    same_class = self.class().eql?(twin.class())
    same_name = self.name().eql?(twin.name())
    same_class.&(same_name)
  end

end
