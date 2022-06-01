require "test_helper"

class FriendRecsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @friend_rec = friend_recs(:one)
  end

  test "should get index" do
    get friend_recs_url
    assert_response :success
  end

  test "should get new" do
    get new_friend_rec_url
    assert_response :success
  end

  test "should create friend_rec" do
    assert_difference("FriendRec.count") do
      post friend_recs_url, params: { friend_rec: { email: @friend_rec.email, first_name: @friend_rec.first_name, last_name: @friend_rec.last_name, phone: @friend_rec.phone, twitter: @friend_rec.twitter } }
    end

    assert_redirected_to friend_rec_url(FriendRec.last)
  end

  test "should show friend_rec" do
    get friend_rec_url(@friend_rec)
    assert_response :success
  end

  test "should get edit" do
    get edit_friend_rec_url(@friend_rec)
    assert_response :success
  end

  test "should update friend_rec" do
    patch friend_rec_url(@friend_rec), params: { friend_rec: { email: @friend_rec.email, first_name: @friend_rec.first_name, last_name: @friend_rec.last_name, phone: @friend_rec.phone, twitter: @friend_rec.twitter } }
    assert_redirected_to friend_rec_url(@friend_rec)
  end

  test "should destroy friend_rec" do
    assert_difference("FriendRec.count", -1) do
      delete friend_rec_url(@friend_rec)
    end

    assert_redirected_to friend_recs_url
  end
end
