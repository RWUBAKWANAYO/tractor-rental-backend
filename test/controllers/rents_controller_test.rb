require "test_helper"

class RentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rent = rents(:one)
  end

  test "should get index" do
    get rents_url, as: :json
    assert_response :success
  end

  test "should create rent" do
    assert_difference("Rent.count") do
      post rents_url, params: { rent: { total_costs: @rent.total_costs } }, as: :json
    end

    assert_response :created
  end

  test "should show rent" do
    get rent_url(@rent), as: :json
    assert_response :success
  end

  test "should update rent" do
    patch rent_url(@rent), params: { rent: { total_costs: @rent.total_costs } }, as: :json
    assert_response :success
  end

  test "should destroy rent" do
    assert_difference("Rent.count", -1) do
      delete rent_url(@rent), as: :json
    end

    assert_response :no_content
  end
end
