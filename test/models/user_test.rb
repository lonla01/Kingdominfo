require "test_helper"

class UserTest < ActiveSupport::TestCase

  setup do
    @logged_in_user = users(:patrice)
    sign_in @logged_in_user
  end

  test "rejects email duplicates" do
    assert_no_difference("User.count") do
      user = @logged_in_user
      new_password = Devise::Encryptor.digest(User, "top_secret")
      new_user = User.new({ email: user.email, pseudo: "MyUser", encrypted_password: new_password })
      assert_not new_user.save, "Tried saving user with duplicate email!"
    end
  end

end
