require('rspec')
require('task')

describe (Task) do
  before() do
    Task.clear()
  end

  describe('#name') do
    it('returns the task name') do
      task_test = Task.new('homework')
      expect(task_test.name()).to(eq('homework'))
    end
  end


#save will be called automatically on init
  describe('.all') do
    it('returns the entire collection of tasks') do
      test_task = Task.new('feed cat')
      expect(Task.all().include?(test_task)).to(eq(true))
    end
  end


end
