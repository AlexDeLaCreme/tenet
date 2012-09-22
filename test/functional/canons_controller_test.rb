require 'test_helper'

class CanonsControllerTest < ActionController::TestCase
  setup do
    @canon = canons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:canons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create canon" do
    assert_difference('Canon.count') do
      post :create, canon: { body: @canon.body }
    end

    assert_redirected_to canon_path(assigns(:canon))
  end

  test "should show canon" do
    get :show, id: @canon
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @canon
    assert_response :success
  end

  test "should update canon" do
    put :update, id: @canon, canon: { body: @canon.body }
    assert_redirected_to canon_path(assigns(:canon))
  end

  test "should destroy canon" do
    assert_difference('Canon.count', -1) do
      delete :destroy, id: @canon
    end

    assert_redirected_to canons_path
  end
end
