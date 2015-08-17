class Category
  @@categories = []
  @@counter = 0


  define_method(:initialize) do |name|
    @name = name
    @tasks = []
    @id = get_next_id()
  end

  define_method(:get_next_id) do
    @@counter += 1
    @@counter
  end

  define_method(:id) do
    @id
  end

  define_method(:name) do
    @name
  end

  define_method(:save) do
    @@categories.push(self)
  end

  define_method(:add_task) do |task|
    @tasks.push(task)
  end

  define_method(:tasks) do
    @tasks
  end


#class methods
  define_singleton_method(:clear) do
    @@categories = []
    @@counter = 0
  end

  define_singleton_method(:all) do
    @@categories
  end

  define_singleton_method(:find) do |id|
    @@categories.each() do |category|
      if category.id() == id
       return category
      end
    end
  end

end
