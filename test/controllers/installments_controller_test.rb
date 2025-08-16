require "test_helper"

class InstallmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get installments_index_url
    assert_response :success
  end

  test "should get show" do
    get installments_show_url
    assert_response :success
  end

  test "should get new" do
    get installments_new_url
    assert_response :success
  end

  test "should get edit" do
    get installments_edit_url
    assert_response :success
  end

  test "should get create" do
    get installments_create_url
    assert_response :success
  end
end
