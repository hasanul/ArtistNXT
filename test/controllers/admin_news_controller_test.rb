require 'test_helper'

class AdminNewsControllerTest < ActionController::TestCase
  setup do
    @admin_news = admin_news(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_news)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_news" do
    assert_difference('AdminNews.count') do
      post :create, admin_news: { created_by: @admin_news.created_by, hits: @admin_news.hits, published: @admin_news.published, text: @admin_news.text, title: @admin_news.title }
    end

    assert_redirected_to admin_news_path(assigns(:admin_news))
  end

  test "should show admin_news" do
    get :show, id: @admin_news
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_news
    assert_response :success
  end

  test "should update admin_news" do
    patch :update, id: @admin_news, admin_news: { created_by: @admin_news.created_by, hits: @admin_news.hits, published: @admin_news.published, text: @admin_news.text, title: @admin_news.title }
    assert_redirected_to admin_news_path(assigns(:admin_news))
  end

  test "should destroy admin_news" do
    assert_difference('AdminNews.count', -1) do
      delete :destroy, id: @admin_news
    end

    assert_redirected_to admin_news_index_path
  end
end
