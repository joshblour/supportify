class AddPublishedToArticles < ActiveRecord::Migration
  def change
    add_column :supportify_articles, :published, :boolean
  end
end
