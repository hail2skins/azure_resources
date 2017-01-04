require 'test_helper'

class NsgsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nsg = nsgs(:one)
  end

  test "should get index" do
    get nsgs_url
    assert_response :success
  end

  test "should get new" do
    get new_nsg_url
    assert_response :success
  end

  test "should create nsg" do
    assert_difference('Nsg.count') do
      post nsgs_url, params: { nsg: { location: @nsg.location, name: @nsg.name, provisioning_state: @nsg.provisioning_state, resource_group: @nsg.resource_group } }
    end

    assert_redirected_to nsg_url(Nsg.last)
  end

  test "should show nsg" do
    get nsg_url(@nsg)
    assert_response :success
  end

  test "should get edit" do
    get edit_nsg_url(@nsg)
    assert_response :success
  end

  test "should update nsg" do
    patch nsg_url(@nsg), params: { nsg: { location: @nsg.location, name: @nsg.name, provisioning_state: @nsg.provisioning_state, resource_group: @nsg.resource_group } }
    assert_redirected_to nsg_url(@nsg)
  end

  test "should destroy nsg" do
    assert_difference('Nsg.count', -1) do
      delete nsg_url(@nsg)
    end

    assert_redirected_to nsgs_url
  end
end
