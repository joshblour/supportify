class CreateSupportifyArticles < ActiveRecord::Migration
  def change
    create_table :supportify_articles do |t|
      t.string :title
      t.string :slug
      t.string :locale
      t.text :body
      t.integer :author_id
      t.datetime :published_at

      t.timestamps
    end
  end
end
