require 'test_helper'

class DataMigrationsControllerTest < ActionController::TestCase
  setup do
    @data_migration = data_migrations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:data_migrations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create data_migration" do
    assert_difference('DataMigration.count') do
      post :create, data_migration: {  }
    end

    assert_redirected_to data_migration_path(assigns(:data_migration))
  end

  test "should show data_migration" do
    get :show, id: @data_migration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @data_migration
    assert_response :success
  end

  test "should update data_migration" do
    put :update, id: @data_migration, data_migration: {  }
    assert_redirected_to data_migration_path(assigns(:data_migration))
  end

  test "should destroy data_migration" do
    assert_difference('DataMigration.count', -1) do
      delete :destroy, id: @data_migration
    end

    assert_redirected_to data_migrations_path
  end
end
