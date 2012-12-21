require 'test_helper'

class PemsControllerTest < ActionController::TestCase
  setup do
    @pem = pems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pem" do
    assert_difference('Pem.count') do
      post :create, pem: { desc: @pem.desc, filepath: @pem.filepath, name: @pem.name, project_id: @pem.project_id }
    end

    assert_redirected_to pem_path(assigns(:pem))
  end

  test "should show pem" do
    get :show, id: @pem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pem
    assert_response :success
  end

  test "should update pem" do
    put :update, id: @pem, pem: { desc: @pem.desc, filepath: @pem.filepath, name: @pem.name, project_id: @pem.project_id }
    assert_redirected_to pem_path(assigns(:pem))
  end

  test "should destroy pem" do
    assert_difference('Pem.count', -1) do
      delete :destroy, id: @pem
    end

    assert_redirected_to pems_path
  end
end
