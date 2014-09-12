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
    
  
    test 'returns articles filtered by tags' do
      article1 = create(:article, tags: ['a', 'b'], categories: ['w', 'x'], admin_tags: ['r', 's'])
      article2 = create(:article, tags: ['b', 'c'], categories: ['x', 'y'], admin_tags: ['s', 't'])
      article3 = create(:article, tags: ['c', 'd'], categories: ['y', 'z'], admin_tags: ['t', 'u'])
  
      assert_equal [article1, article2].to_set, Article.by_tags('a', 'b').to_set
      assert_equal [article2, article3].to_set, Article.by_categories('y', 'z').to_set
      assert_equal [article1, article3].to_set, Article.by_admin_tags('r', 'u').to_set
      assert_equal [article2], Article.by_tags('b').by_categories('y').by_admin_tags(['s', 'u'])
    end
    
    test 'full text search with priority' do
      article1 = create(:article, title: 'xxxxxxx', tags: ['abc', 'xxxx'], categories: ['def', 'xxxx'], admin_tags: ['zxcx', 'sdfkm'], body: 'test123')
      article2 = create(:article, title: 'abc def', tags: ['hij', 'xxxx'], categories: ['klm', 'xxxx'], admin_tags: ['zxcx', 'sdfkm'], body: 'test123')
      article3 = create(:article, title: 'xxxxxxx', tags: ['nop', 'xxxx'], categories: ['abc', 'xxxx'], admin_tags: ['zxcx', 'sdfkm'], body: 'test123')
      article4 = create(:article, title: 'xxxxxxx', tags: ['nop', 'xxxx'], categories: ['qrs', 'xxxx'], admin_tags: ['zxcx', 'sdfkm'], body: 'abc def hij')
      article5 = create(:article, title: 'xxxxxxx', tags: ['nop', 'xxxx'], categories: ['qrs', 'xxxx'], admin_tags: ['abc', 'ssdfkm'], body: 'test123')
      
      assert_equal [article2, article3, article1, article4], Article.text_search('abc')
    end
  end
end
