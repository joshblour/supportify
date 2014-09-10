require 'test_helper'

module Supportify
  class ArticlesControllerTest < ActionController::TestCase
    setup do
      @article = create(:article)
    end
    
    test "admin should get index" do
      @user = User.create(role: 'admin')
      
      get :index
      assert_response :success
      assert_not_nil assigns(:articles)
    end

    test "admin should get new" do
      @user = User.create(role: 'admin')
      
      get :new
      assert_response :success
    end

    test "admin should create article" do
      @user = User.create(role: 'admin')
      
      assert_difference('Article.count') do
        post :create, article: { author_id: @article.author_id, body: @article.body, locale: @article.locale, published_at: @article.published_at, slug: @article.slug + '1', title: @article.title }
      end

      assert_redirected_to article_path(assigns(:article))
    end

    test "admin should show article" do
      @user = User.create(role: 'admin')
      
      get :show, id: @article
      assert_response :success
    end

    test "admin should get edit" do
      @user = User.create(role: 'admin')
      
      get :edit, id: @article
      assert_response :success
    end

    test "admin should update article" do
      @user = User.create(role: 'admin')
      
      patch :update, id: @article, article: { author_id: @article.author_id, body: @article.body, locale: @article.locale, published_at: @article.published_at, slug: @article.slug, title: @article.title }
      assert_redirected_to article_path(assigns(:article))
    end

    test "admin should destroy article" do
      @user = User.create(role: 'admin')
      
      assert_difference('Article.count', -1) do
        delete :destroy, id: @article
      end

      assert_redirected_to articles_path
    end
  end
end
