require 'test_helper'

module Supportify
  class ArticleTest < ActiveSupport::TestCase
    test "updates published at if published_at changed" do
      #does not set pubslished at if not published
      article = create(:article, published: false)
      assert_nil article.published_at
      
      #sets pubslished_at when published is set to true
      article.published = true
      article.save
      assert_not_nil article.published_at
      
      #does not reset published_at if set again to true
      timestamp = article.published_at
      article.published = true
      article.save
      assert_equal timestamp, article.published_at
      
      #clears published_at if unpublished
      article.published = false
      article.save
      assert_nil article.published_at
      
      #sets pubslished_at again when published is set back to true
      article.published = true
      article.save
      assert_not_nil article.published_at
      
    end
  end
end
