class Task
  @@tasks = []
  define_method(:initialize) do |name|
    @name = name
    save()
  end

  define_method(:name) do
     @name
  end

  define_singleton_method(:all) do
    @@tasks
  end

  define_singleton_method(:clear) do
    @@tasks = []
  end

  define_method(:save) do
    @@tasks.push(self)
  end
end
