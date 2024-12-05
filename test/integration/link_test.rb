require 'test_helper'

class LinkTest < ActionDispatch::IntegrationTest
  test 'links index' do
    get links_path
    assert_response :ok
  end

  test 'links index pagination' do
    get links_path(page: 2)
    assert_response :ok
  end

  test 'links show page' do
    get links_path(links(:one))
    assert_response :ok
  end

  test 'create link requires url' do
    post links_path, params: { link: { url: '' } }
    assert_response :unprocessable_entity
  end

  test 'create link as guest' do
    assert_difference 'Link.count' do
      post links_path(format: :turbo_stream), params: { link: { url: 'https://google.com' } }
      assert_response :ok
      assert_nil Link.last.user_id
    end
  end

  test 'create link as user' do
    user = users(:one)
    sign_in user
    assert_difference 'Link.count' do
      post links_path(format: :turbo_stream), params: { link: { url: 'https://google.com' } }
      assert_response :ok
      assert_equal user.id, Link.last.user_id
    end
  end

  test 'guest cannot edit link' do
    get edit_link_path(links(:anonymous))
    assert_response :redirect
  end

  test "guest cannot edit user's link" do
    get edit_link_path(links(:one))
    assert_response :redirect
  end

  test 'user can edit ther own link' do
    sign_in users(:one)
    get edit_link_path(links(:one))
    assert_response :ok
  end

  test "user cannot edit another user's link" do
    sign_in users(:one)
    get edit_link_path(links(:two))
    assert_response :redirect
  end

  test 'user cannot edit anonymous link' do
  end
end
