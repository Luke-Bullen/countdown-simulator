require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  test "Going to /new gives us a new random grid to play with" do
    visit new_url
    assert test: "New game"
    assert_selector "li", count: 10
  end

  test "You can fill the form with a random word, click the play button, and get a message that the word is not in the grid" do
    visit new_url
    # choose an 11 letter word so wont be an option as only 10 letters given
    fill_in "input", with: "abandonment"
    click_on "Play"
    assert_text "can't be built from the provided letters"
  end

  test "You can fill the form with a one-letter word and not let it be input" do
    visit new_url
    # inputting less than 3 characters
    fill_in "input", with: "t"
    click_on "Play"
    # checks still on root (/new) page - could also check the url
    assert_text "What's the longest word you can find?"
  end
end

