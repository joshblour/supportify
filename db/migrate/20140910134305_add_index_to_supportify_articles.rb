class AddIndexToSupportifyArticles < ActiveRecord::Migration
  def change
    add_index  :supportify_articles, :tags, using: 'gin'
    add_index  :supportify_articles, :categories, using: 'gin'
    add_index  :supportify_articles, :admin_tags, using: 'gin'    
  end
end
