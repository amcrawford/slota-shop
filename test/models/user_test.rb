require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'user default role is not admin' do
    user = User.create(username: "John", password: "Password")

    assert_equal "default", user.role
  end
end
