require 'test_helper'

class EnvironmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @environment = environments(:one)
  end

  test "should get index" do
    get environments_url
    assert_response :success
  end

  test "should get new" do
    get new_environment_url
    assert_response :success
  end

  test "should create environment" do
    assert_difference('Environment.count') do
      post environments_url, params: { environment: { db_url: @environment.db_url, db_user: @environment.db_user, git_hub_release: @environment.git_hub_release, name: @environment.name, url: @environment.url, version: @environment.version } }
    end

    assert_redirected_to environment_url(Environment.last)
  end

  test "should show environment" do
    get environment_url(@environment)
    assert_response :success
  end

  test "should get edit" do
    get edit_environment_url(@environment)
    assert_response :success
  end

  test "should update environment" do
    patch environment_url(@environment), params: { environment: { db_url: @environment.db_url, db_user: @environment.db_user, git_hub_release: @environment.git_hub_release, name: @environment.name, url: @environment.url, version: @environment.version } }
    assert_redirected_to environment_url(@environment)
  end

  test "should destroy environment" do
    assert_difference('Environment.count', -1) do
      delete environment_url(@environment)
    end

    assert_redirected_to environments_url
  end
end
