class AddTagsToSupportifyArticles < ActiveRecord::Migration
  def change
    add_column :supportify_articles, :tags, :string, array: true, default: []
    add_column :supportify_articles, :categories, :string, array: true, default: []
    add_column :supportify_articles, :admin_tags, :string, array: true, default: []
    
  end
end
