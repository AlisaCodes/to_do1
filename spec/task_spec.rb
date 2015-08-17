require('rspec')
require('pg')
require('task')


  #OLD WAY OF CLEARING
  # before() do
  #   Task.clear()
  # end

  DB = PG.connect({:dbname => 'to_do_test'})

  #NEW WAY TO CLEAR
  RSpec.configure do |config|
      config.after(:each) do
        DB.exec("DELETE FROM task *;")
      end
  end


# describe (Task) do
#   describe('#name') do
#     it('returns the task name') do
#       task_test = Task.new('homework')
#       expect(task_test.name()).to(eq('homework'))
#     end
#   end
#
#
# #save will be called automatically on init
#   describe('.all') do
#     it('returns the entire collection of tasks') do
#       test_task = Task.new('feed cat')
#       expect(Task.all().include?(test_task)).to(eq(true))
#     end
#   end
#
#   describe("#==") do
#     it("overrides the ruby/rspec equals comparison behavior") do
#       task1 = Task.new('new task')
#       task2 = Task.new ('new task')
#       expect(task1 == task2).to(eq(true))
#     end
#   end
#
#
# end
