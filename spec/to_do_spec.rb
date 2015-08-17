require('rspec')
require('pry')
require('category')
require('task')

describe (Task) do

  describe('#name') do
    it('returns the task name') do
      task_test = Task.new('homework')
      expect(task_test.name()).to(eq('homework'))
    end
  end

  describe('.clear') do
    it('returns an empty collection') do
      Task.clear()
      expect(Task.all().length()).to(eq(0))
    end
  end

#save will be called automatically on init
  describe('.all') do
    it('returns the entire collection of tasks') do
      task_test = Task.new('feed cat')
      expect(Task.all().include?('feed cat')).to(eq(true))
    end
  end
end
