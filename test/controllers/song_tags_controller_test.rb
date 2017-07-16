require 'test_helper'

class SongTagsControllerTest < ActionController::TestCase
  setup do
    @song_tag = song_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:song_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create song_tag" do
    assert_difference('SongTag.count') do
      post :create, song_tag: { song_id: @song_tag.song_id, tag_name: @song_tag.tag_name }
    end

    assert_redirected_to song_tag_path(assigns(:song_tag))
  end

  test "should show song_tag" do
    get :show, id: @song_tag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @song_tag
    assert_response :success
  end

  test "should update song_tag" do
    patch :update, id: @song_tag, song_tag: { song_id: @song_tag.song_id, tag_name: @song_tag.tag_name }
    assert_redirected_to song_tag_path(assigns(:song_tag))
  end

  test "should destroy song_tag" do
    assert_difference('SongTag.count', -1) do
      delete :destroy, id: @song_tag
    end

    assert_redirected_to song_tags_path
  end
end
