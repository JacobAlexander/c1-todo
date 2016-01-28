require 'test_helper'

class TaskTest < ActiveSupport::TestCase

  def setup
    @task = Task.new(board_id: 1, content: 'New Task', finished: false, start_date: Date.current)
  end

  test "task should be valid" do
    assert @task.valid?
  end
  test "task should be assigned to board" do
    @task.board_id = ''
    assert_not @task.valid?
  end
  test "task should have min 3 char" do
    @task.content = 'ab'
    assert_not @task.valid?
  end
  test "task should have max 160 char" do
    @task.content = 'a'*161
    assert_not @task.valid?
  end
  test "task finished field should be boolean" do
    @task.finished = 8
    assert_not @task.valid?
  end
  test "task should have start date" do
    @task.start_date = ''
    assert_not @task.valid?
  end
end
