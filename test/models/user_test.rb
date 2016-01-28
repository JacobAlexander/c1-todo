require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: 'JohnDoe', email: 'johndoe@example.com', password: '123456', password_confirmation: '123456')
  end

  test "user can be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = ''
    assert_not @user.valid?
  end
  test "name should have min 3 characters" do
    @user.name = 'aa'
    assert_not @user.valid?
  end
  test "name should be unique" do
    user_duplicate = @user.dup
    user_duplicate.email = 'Johnny@example.co'
    user_duplicate.save
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = ''
    assert_not @user.valid?
  end
  test "email should have min 6 char" do
    @user.email = 'a@bc.de'
    assert @user.valid?
  end
  test "email should have max 100 char" do
    user_duplicate = @user
    user_duplicate.email = 'a'*96+'@b.cd'
    assert_not user_duplicate.valid?
  end
  test "email should be correct" do
    ['a@b', 'a@b.c', '@bc.de', 'a@b.c.d', 'a b@cd'].each do |email|
      @user.email = email
      assert_not @user.valid?
    end
  end
  test "email should be unique" do
    user_duplicate = @user.dup
    user_duplicate.name = 'JonesS'
    user_duplicate.save
    assert_not @user.valid?
  end

  test "password should be present" do
    @user.password = ''
    @user.password_confirmation = ''
    assert_not @user.valid?
  end
  test "password should have min 6 char" do
    @user.password = 'a'*5
    @user.password_confirmation = @user.password
    assert_not @user.valid?
  end
  test "password should have max 20 char" do
    @user.password = 'a'*21
    @user.password_confirmation = @user.password
    assert_not @user.valid?
  end
  test "password_confirmation should be present" do
    @user.password_confirmation = ''
    assert_not @user.valid?
  end
end
