require 'test_helper'

class TokensControllerTest < ActionController::TestCase
  setup do
    @token = tokens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tokens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create token" do
    assert_difference('Token.count') do
      post :create, token: { desc: @token.desc, message_id: @token.message_id, name: @token.name }
    end

    assert_redirected_to token_path(assigns(:token))
  end

  test "should show token" do
    get :show, id: @token
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @token
    assert_response :success
  end

  test "should update token" do
    put :update, id: @token, token: { desc: @token.desc, message_id: @token.message_id, name: @token.name }
    assert_redirected_to token_path(assigns(:token))
  end

  test "should destroy token" do
    assert_difference('Token.count', -1) do
      delete :destroy, id: @token
    end

    assert_redirected_to tokens_path
  end
end
