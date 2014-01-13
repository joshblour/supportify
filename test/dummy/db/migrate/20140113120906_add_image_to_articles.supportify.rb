# This migration comes from supportify (originally 20140113120833)
class AddImageToArticles < ActiveRecord::Migration
  def change
    add_column :supportify_articles, :image, :string
  end
end
