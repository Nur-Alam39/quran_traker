require "test_helper"

class SurahsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @surah = surahs(:one)
  end

  test "should get index" do
    get surahs_url
    assert_response :success
  end

  test "should get new" do
    get new_surah_url
    assert_response :success
  end

  test "should create surah" do
    assert_difference("Surah.count") do
      post surahs_url, params: { surah: { completion_date: @surah.completion_date, due: @surah.due, full_recite_count: @surah.full_recite_count, place_of_revealed: @surah.place_of_revealed, recited: @surah.recited, serial_number: @surah.serial_number, starting_date: @surah.starting_date, status: @surah.status, verses: @surah.verses } }
    end

    assert_redirected_to surah_url(Surah.last)
  end

  test "should show surah" do
    get surah_url(@surah)
    assert_response :success
  end

  test "should get edit" do
    get edit_surah_url(@surah)
    assert_response :success
  end

  test "should update surah" do
    patch surah_url(@surah), params: { surah: { completion_date: @surah.completion_date, due: @surah.due, full_recite_count: @surah.full_recite_count, place_of_revealed: @surah.place_of_revealed, recited: @surah.recited, serial_number: @surah.serial_number, starting_date: @surah.starting_date, status: @surah.status, verses: @surah.verses } }
    assert_redirected_to surah_url(@surah)
  end

  test "should destroy surah" do
    assert_difference("Surah.count", -1) do
      delete surah_url(@surah)
    end

    assert_redirected_to surahs_url
  end
end
