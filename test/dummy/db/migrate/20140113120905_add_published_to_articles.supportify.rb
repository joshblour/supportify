# This migration comes from supportify (originally 20140112193628)
class AddPublishedToArticles < ActiveRecord::Migration
  def change
    add_column :supportify_articles, :published, :boolean
  end
end
