require 'test_helper'

class NsgrulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nsgrule = nsgrules(:one)
  end

  test "should get index" do
    get nsgrules_url
    assert_response :success
  end

  test "should get new" do
    get new_nsgrule_url
    assert_response :success
  end

  test "should create nsgrule" do
    assert_difference('Nsgrule.count') do
      post nsgrules_url, params: { nsgrule: { access: @nsgrule.access, destination_port_range: @nsgrule.destination_port_range, destination_address_prefix: @nsgrule.destination_address_prefix, direction: @nsgrule.direction, name: @nsgrule.name, nsg: @nsgrule.nsg, priority: @nsgrule.priority, protocol: @nsgrule.protocol, source_port_range: @nsgrule.source_port_range, source_address_prefix: @nsgrule.source_address_prefix } }
    end

    assert_redirected_to nsgrule_url(Nsgrule.last)
  end

  test "should show nsgrule" do
    get nsgrule_url(@nsgrule)
    assert_response :success
  end

  test "should get edit" do
    get edit_nsgrule_url(@nsgrule)
    assert_response :success
  end

  test "should update nsgrule" do
    patch nsgrule_url(@nsgrule), params: { nsgrule: { access: @nsgrule.access, destination_port_range: @nsgrule.destination_port_range, destination_address_prefix: @nsgrule.destination_address_prefix, direction: @nsgrule.direction, name: @nsgrule.name, nsg: @nsgrule.nsg, priority: @nsgrule.priority, protocol: @nsgrule.protocol, source_port_range: @nsgrule.source_port_range, source_address_prefix: @nsgrule.source_address_prefix } }
    assert_redirected_to nsgrule_url(@nsgrule)
  end

  test "should destroy nsgrule" do
    assert_difference('Nsgrule.count', -1) do
      delete nsgrule_url(@nsgrule)
    end

    assert_redirected_to nsgrules_url
  end
end
