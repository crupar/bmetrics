require 'test_helper'

class RegisteredApplicationsControllerTest < ActionController::TestCase
  setup do
    @registered_application = registered_applications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:registered_applications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create registered_application" do
    assert_difference('RegisteredApplication.count') do
      post :create, registered_application: { name: @registered_application.name, url: @registered_application.url, user_id: @registered_application.user_id }
    end

    assert_redirected_to registered_application_path(assigns(:registered_application))
  end

  test "should show registered_application" do
    get :show, id: @registered_application
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @registered_application
    assert_response :success
  end

  test "should update registered_application" do
    patch :update, id: @registered_application, registered_application: { name: @registered_application.name, url: @registered_application.url, user_id: @registered_application.user_id }
    assert_redirected_to registered_application_path(assigns(:registered_application))
  end

  test "should destroy registered_application" do
    assert_difference('RegisteredApplication.count', -1) do
      delete :destroy, id: @registered_application
    end

    assert_redirected_to registered_applications_path
  end
end
