require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                    password: "foobar", password_confirmation: "foobar")
  end

  # general tests

  test "should be valid" do
    assert @user.valid?
  end

  # name tests

  test "name should be present" do
    @user.name = "   "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  # email tests

  test "email should be present" do
    @user.email = "   "
    assert_not @user.valid?
  end



  test "email should not be too long" do
    @user.email = "a" * 256
    assert_not @user.valid?
  end

  test "email validation should accept valid adresses" do
    valid_addresses = %w[selius22@gmail.com
                        baartoszsobczynski@gmail.com
                        USER@foo.COM
                        A_US-ER@foo.bar.org]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address} should be valid"
    end
  end

  test "email validation should reject invalid adresses" do
    valid_addresses = %w[selius22@gmail,com
                        baartoszsobczynski@gmail.
                        USER@foo_COM
                        A_US-ER@]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert_not @user.valid?, "#{valid_address} should be invalid"
    end
  end

  test "email validation should reject duplicates" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  # password tests

  test "password should have a minimal length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end
