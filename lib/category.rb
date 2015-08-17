class Category
  @@categories = []
  define_method(:initialize) do |name|
    @name = name
    @tasks = []
  end

  define_method(:name) do
    @name
  end

  define_method(:save) do
    @@categories.push(self)
  end

  define_singleton_method(:clear) do
    @@categories = []
  end

  define_singleton_method(:all) do
    @@categories
  end

  define_method(:add_task) do |task|
    @tasks.push(task)
  end

  define_method(:tasks) do
    @tasks
  end
end
