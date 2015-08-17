require('rspec')
require('pg')
require('category')
require('task')

DB = PG.connect({:dbname => 'to_do_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM category *;")
    DB.exec("ALTER SEQUENCE category_id_seq restart with 1")
  end
end


describe('Category') do
  # before() do
  #   Category.clear()
  # end

  describe('#name') do
    it('adds a new category and returns the name') do
      test_cat = Category.new('school')
      test_cat.save()
      expect(test_cat.name()).to(eq('school'))
    end
  end

  describe('#save') do
    it('saves the instance to the full array') do
      test_cat = Category.new('school')
      test_cat.save()
      expect(Category.all()).to(eq([test_cat]))
    end
  end
  #
  # describe('.all') do
  #   it('begins empty') do
  #     expect(Category.all()).to(eq([]))
  #   end
  # end
  #
  # describe('#add_task') do
  #   it('returns an array of task objects') do
  #     new_task = Task.new('eat lunch')
  #     new_cat = Category.new('home tasks')
  #     new_cat.add_task(new_task)
  #     expect(new_cat.tasks().include?(new_task)).to(eq(true))
  #   end
  # end
  #
  # describe('#id') do
  #   it('returns the category id') do
  #     new_cat = Category.new('school')
  #     new_cat.save()
  #     expect(new_cat.id()).to(eq(1))
  #   end
  # end
  #
  # describe('.find') do
  #   it('finds the category by the id') do
  #     new_cat = Category.new('school')
  #     new_cat.save()
  #     new_cat2 = Category.new('home')
  #     new_cat2.save()
  #     expect(Category.find(1)).to(eq(new_cat))
  #   end
  # end
end
