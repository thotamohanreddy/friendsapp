require "application_system_test_case"

class FriendRecsTest < ApplicationSystemTestCase
  setup do
    @friend_rec = friend_recs(:one)
  end

  test "visiting the index" do
    visit friend_recs_url
    assert_selector "h1", text: "Friend recs"
  end

  test "should create friend rec" do
    visit friend_recs_url
    click_on "New friend rec"

    fill_in "Email", with: @friend_rec.email
    fill_in "First name", with: @friend_rec.first_name
    fill_in "Last name", with: @friend_rec.last_name
    fill_in "Phone", with: @friend_rec.phone
    fill_in "Twitter", with: @friend_rec.twitter
    click_on "Create Friend rec"

    assert_text "Friend rec was successfully created"
    click_on "Back"
  end

  test "should update Friend rec" do
    visit friend_rec_url(@friend_rec)
    click_on "Edit this friend rec", match: :first

    fill_in "Email", with: @friend_rec.email
    fill_in "First name", with: @friend_rec.first_name
    fill_in "Last name", with: @friend_rec.last_name
    fill_in "Phone", with: @friend_rec.phone
    fill_in "Twitter", with: @friend_rec.twitter
    click_on "Update Friend rec"

    assert_text "Friend rec was successfully updated"
    click_on "Back"
  end

  test "should destroy Friend rec" do
    visit friend_rec_url(@friend_rec)
    click_on "Destroy this friend rec", match: :first

    assert_text "Friend rec was successfully destroyed"
  end
end
