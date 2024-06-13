require "application_system_test_case"

class SurahsTest < ApplicationSystemTestCase
  setup do
    @surah = surahs(:one)
  end

  test "visiting the index" do
    visit surahs_url
    assert_selector "h1", text: "Surahs"
  end

  test "should create surah" do
    visit surahs_url
    click_on "New surah"

    fill_in "Completion date", with: @surah.completion_date
    fill_in "Due", with: @surah.due
    fill_in "Full recite count", with: @surah.full_recite_count
    fill_in "Place of revealed", with: @surah.place_of_revealed
    fill_in "Recited", with: @surah.recited
    fill_in "Serial number", with: @surah.serial_number
    fill_in "Starting date", with: @surah.starting_date
    fill_in "Status", with: @surah.status
    fill_in "Verses", with: @surah.verses
    click_on "Create Surah"

    assert_text "Surah was successfully created"
    click_on "Back"
  end

  test "should update Surah" do
    visit surah_url(@surah)
    click_on "Edit this surah", match: :first

    fill_in "Completion date", with: @surah.completion_date
    fill_in "Due", with: @surah.due
    fill_in "Full recite count", with: @surah.full_recite_count
    fill_in "Place of revealed", with: @surah.place_of_revealed
    fill_in "Recited", with: @surah.recited
    fill_in "Serial number", with: @surah.serial_number
    fill_in "Starting date", with: @surah.starting_date
    fill_in "Status", with: @surah.status
    fill_in "Verses", with: @surah.verses
    click_on "Update Surah"

    assert_text "Surah was successfully updated"
    click_on "Back"
  end

  test "should destroy Surah" do
    visit surah_url(@surah)
    click_on "Destroy this surah", match: :first

    assert_text "Surah was successfully destroyed"
  end
end
