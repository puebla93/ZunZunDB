require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  setup do
    @article = articles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:articles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create article" do
    assert_difference('Article.count') do
      post :create, article: { author: @article.author, colorist: @article.colorist, gender: @article.gender, ilustrator: @article.ilustrator, magazineId: @article.magazineId, original: @article.original, originallocation: @article.originallocation, pdf: @article.pdf, photographer: @article.photographer, section: @article.section, subject: @article.subject, thematicdesing: @article.thematicdesing, title: @article.title, totalpages: @article.totalpages }
    end

    assert_redirected_to article_path(assigns(:article))
  end

  test "should show article" do
    get :show, id: @article
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @article
    assert_response :success
  end

  test "should update article" do
    patch :update, id: @article, article: { author: @article.author, colorist: @article.colorist, gender: @article.gender, ilustrator: @article.ilustrator, magazineId: @article.magazineId, original: @article.original, originallocation: @article.originallocation, pdf: @article.pdf, photographer: @article.photographer, section: @article.section, subject: @article.subject, thematicdesing: @article.thematicdesing, title: @article.title, totalpages: @article.totalpages }
    assert_redirected_to article_path(assigns(:article))
  end

  test "should destroy article" do
    assert_difference('Article.count', -1) do
      delete :destroy, id: @article
    end

    assert_redirected_to articles_path
  end
end
