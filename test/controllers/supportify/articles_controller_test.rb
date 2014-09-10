require 'test_helper'

module Supportify
  class ArticlesControllerTest < ActionController::TestCase
    setup do
      @article = create(:article)
      @user = User.create
      
    end
    
    test "user should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:articles)
    end

    test "user should get new" do      
      get :new
      assert_response :success
    end

    test "user should create article" do      
      assert_difference('Article.count') do
        post :create, article: { author_id: @article.author_id, body: @article.body, locale: @article.locale, published_at: @article.published_at, slug: @article.slug + '1', title: @article.title }
      end

      assert_redirected_to article_path(assigns(:article))
    end

    test "user should show article" do      
      get :show, id: @article
      assert_response :success
    end

    test "user should get edit" do      
      get :edit, id: @article
      assert_response :success
    end

    test "user should update article" do      
      patch :update, id: @article, article: { author_id: @article.author_id, body: @article.body, locale: @article.locale, published_at: @article.published_at, slug: @article.slug, title: @article.title }
      assert_redirected_to article_path(assigns(:article))
    end

    test "user should destroy article" do      
      assert_difference('Article.count', -1) do
        delete :destroy, id: @article
      end

      assert_redirected_to articles_path
    end
  end
end
