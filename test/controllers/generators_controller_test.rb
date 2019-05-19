require 'test_helper'

class GeneratorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @generator = generators(:one)
  end

  test "should get index" do
    get generators_url
    assert_response :success
  end

  test "should get new" do
    get new_generator_url
    assert_response :success
  end

  test "should create generator" do
    assert_difference('Generator.count') do
      post generators_url, params: { generator: { a_vol: @generator.a_vol, b_vol: @generator.b_vol, c_vol: @generator.c_vol, d_vol: @generator.d_vol, email: @generator.email, first_name: @generator.first_name, last_name: @generator.last_name, note: @generator.note } }
    end

    assert_redirected_to generator_url(Generator.last)
  end

  test "should show generator" do
    get generator_url(@generator)
    assert_response :success
  end

  test "should get edit" do
    get edit_generator_url(@generator)
    assert_response :success
  end

  test "should update generator" do
    patch generator_url(@generator), params: { generator: { a_vol: @generator.a_vol, b_vol: @generator.b_vol, c_vol: @generator.c_vol, d_vol: @generator.d_vol, email: @generator.email, first_name: @generator.first_name, last_name: @generator.last_name, note: @generator.note } }
    assert_redirected_to generator_url(@generator)
  end

  test "should destroy generator" do
    assert_difference('Generator.count', -1) do
      delete generator_url(@generator)
    end

    assert_redirected_to generators_url
  end
end
