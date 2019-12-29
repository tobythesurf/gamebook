require 'test_helper'

class ScenariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scenario = scenarios(:one)
  end

  test "should get index" do
    get scenarios_url
    assert_response :success
  end

  test "should get new" do
    get new_scenario_url
    assert_response :success
  end

  test "should create scenario" do
    assert_difference('Scenario.count') do
      post scenarios_url, params: { scenario: { book_id: @scenario.book_id, description: @scenario.description, next_no1: @scenario.next_no1, next_no2: @scenario.next_no2, next_no3: @scenario.next_no3, scenario_no: @scenario.scenario_no } }
    end

    assert_redirected_to scenario_url(Scenario.last)
  end

  test "should show scenario" do
    get scenario_url(@scenario)
    assert_response :success
  end

  test "should get edit" do
    get edit_scenario_url(@scenario)
    assert_response :success
  end

  test "should update scenario" do
    patch scenario_url(@scenario), params: { scenario: { book_id: @scenario.book_id, description: @scenario.description, next_no1: @scenario.next_no1, next_no2: @scenario.next_no2, next_no3: @scenario.next_no3, scenario_no: @scenario.scenario_no } }
    assert_redirected_to scenario_url(@scenario)
  end

  test "should destroy scenario" do
    assert_difference('Scenario.count', -1) do
      delete scenario_url(@scenario)
    end

    assert_redirected_to scenarios_url
  end
end
