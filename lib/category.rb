class Category
  # @@categories = []
  # @@counter = 0


  define_method(:initialize) do |name|
    @name = name
    @tasks = []

  end

  define_method(:get_last_id) do
    # @@counter += 1
    # @@counter
    DB.exec("SELECT max(id) from category;")
  end

  define_method(:id) do
    DB.exec("Select id from category where name like '#{@name}'")
  end

  define_method(:name) do
    @name
  end

  define_method(:save) do

    DB.exec("INSERT INTO category (name) VALUES ('#{@name}');")

    # @@categories.push(self)
  end

  define_method(:add_task) do |task|
    @tasks.push(task)
  end

  define_method(:tasks) do
    @tasks
  end


#class methods
  define_singleton_method(:clear) do
    DB.exec("DELETE FROM category *;")
    DB.exec("alter sequence category_id_seq restart with 1;")
    # @@categories = []
    # @@counter = 0
  end

  define_singleton_method(:all) do
    returned_categories = DB.exec("SELECT * FROM category;")
    categories = []
    returned_categories.each() do |category|
      name = category.fetch("name")
      new_cat = Category.new(name)
      categories.push(new_cat)
    end
    categories
  end

  define_singleton_method(:find) do |id|
    @@categories.each() do |category|
      if category.id() == id
       return category
      end
    end
  end

  define_method(:==) do |twin|
    same_class = self.class().eql?(twin.class())
    same_name = self.name().eql?(twin.name())
    same_class.&(same_name)
  end

end
