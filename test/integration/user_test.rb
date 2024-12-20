require 'test_helper'

class UserTest < ActionDispatch::IntegrationTest
  test 'guest user' do
    get links_path
    assert_select 'a', 'Login'
  end

  test 'user can be logged in' do
    sign_in users(:one)
    get links_path
    assert_select 'a', 'Profile'
    assert_match 'Profile', response.body
  end
end
