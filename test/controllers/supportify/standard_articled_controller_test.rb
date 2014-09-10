require 'test_helper'

module Supportify
  class ArticlesControllerTest < ActionController::TestCase
    setup do
      @article = create(:article)
    end
    
    test "standard should get index" do
      @user = User.create(role: 'standard')
      
      get :index
      assert_response :success
      assert_not_nil assigns(:articles)
    end

    test "standard should not get new" do
      @user = User.create(role: 'standard')
      
      get :new
      assert_response :unauthorized
    end

    test "standard should not create article" do
      @user = User.create(role: 'standard')
      
      assert_no_difference('Article.count') do
        post :create, article: { author_id: @article.author_id, body: @article.body, locale: @article.locale, published_at: @article.published_at, slug: @article.slug, title: @article.title }
      end
      
      assert_response :unauthorized
    end

    test "standard should show article" do
      @user = User.create(role: 'standard')
      
      get :show, id: @article
      assert_response :success
    end

    test "standard should not get edit" do
      @user = User.create(role: 'standard')
      
      get :edit, id: @article
      assert_response :unauthorized
    end

    test "standard should not update article" do
      @user = User.create(role: 'standard')
      
      patch :update, id: @article, article: { author_id: @article.author_id, body: @article.body, locale: @article.locale, published_at: @article.published_at, slug: @article.slug, title: @article.title }
      assert_response :unauthorized
    end

    test "standard should destroy article" do
      @user = User.create(role: 'standard')
      
      assert_no_difference('Article.count') do
        delete :destroy, id: @article
      end

      assert_response :unauthorized
    end
  end
end
