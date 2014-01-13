class AddImageToArticles < ActiveRecord::Migration
  def change
    add_column :supportify_articles, :image, :string
  end
end
