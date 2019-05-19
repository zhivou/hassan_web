require 'test_helper'

class MechanicalPropsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mechanical_prop = mechanical_props(:one)
  end

  test "should get index" do
    get mechanical_props_url
    assert_response :success
  end

  test "should get new" do
    get new_mechanical_prop_url
    assert_response :success
  end

  test "should create mechanical_prop" do
    assert_difference('MechanicalProp.count') do
      post mechanical_props_url, params: { mechanical_prop: { carbon: @mechanical_prop.carbon, hv: @mechanical_prop.hv, structure: @mechanical_prop.structure, ut: @mechanical_prop.ut, ys: @mechanical_prop.ys } }
    end

    assert_redirected_to mechanical_prop_url(MechanicalProp.last)
  end

  test "should show mechanical_prop" do
    get mechanical_prop_url(@mechanical_prop)
    assert_response :success
  end

  test "should get edit" do
    get edit_mechanical_prop_url(@mechanical_prop)
    assert_response :success
  end

  test "should update mechanical_prop" do
    patch mechanical_prop_url(@mechanical_prop), params: { mechanical_prop: { carbon: @mechanical_prop.carbon, hv: @mechanical_prop.hv, structure: @mechanical_prop.structure, ut: @mechanical_prop.ut, ys: @mechanical_prop.ys } }
    assert_redirected_to mechanical_prop_url(@mechanical_prop)
  end

  test "should destroy mechanical_prop" do
    assert_difference('MechanicalProp.count', -1) do
      delete mechanical_prop_url(@mechanical_prop)
    end

    assert_redirected_to mechanical_props_url
  end
end
