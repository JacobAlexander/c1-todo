require 'test_helper'

class BoardTest < ActiveSupport::TestCase

  def setup
    @board = Board.new(user_id: '1', name: 'Home')
  end

  test "board should be valid" do
    assert @board.valid?
  end
  test "board should be assigned to user" do
    @board.user_id = ''
    assert_not @board.valid?
  end
  test "board should have min 3 char" do
    @board.name = 'ab'
    assert_not @board.valid?
  end
  test "board should have max 20 char" do
    @board.name = 'a'*21
    assert_not @board.valid?
  end
end
