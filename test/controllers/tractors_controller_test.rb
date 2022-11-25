require 'test_helper'

class TractorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tractor = tractors(:one)
  end

  test 'should get index' do
    get tractors_url, as: :json
    assert_response :success
  end

  test 'should create tractor' do
    assert_difference('Tractor.count') do
      post tractors_url,
           params: { tractor: { completion: @tractor.completion, demand: @tractor.demand, description: @tractor.description, photo: @tractor.photo, price: @tractor.price, title: @tractor.title } }, as: :json
    end

    assert_response :created
  end

  test 'should show tractor' do
    get tractor_url(@tractor), as: :json
    assert_response :success
  end

  test 'should update tractor' do
    patch tractor_url(@tractor),
          params: { tractor: { completion: @tractor.completion, demand: @tractor.demand, description: @tractor.description, photo: @tractor.photo, price: @tractor.price, title: @tractor.title } }, as: :json
    assert_response :success
  end

  test 'should destroy tractor' do
    assert_difference('Tractor.count', -1) do
      delete tractor_url(@tractor), as: :json
    end

    assert_response :no_content
  end
end
