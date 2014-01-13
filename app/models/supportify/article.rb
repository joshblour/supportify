module Supportify
  class Article < ActiveRecord::Base
    include PgSearch
    pg_search_scope :search, 
      against: {
        title: 'A',
        body: 'C'
      }, 
      associated_against: {
        tags: {name: 'B'}
      }
    
    before_save :set_published_at
    belongs_to :author, class_name: Supportify.author_class.to_s
    mount_uploader :image, ImageUploader
    
    acts_as_taggable_on :tags, :categories, :admin_tags
    
    validates :title, :slug, :locale, :body, presence: true
    validates :slug, uniqueness: true
    validates :locale, inclusion: Supportify.locales.map(&:to_s)
    
    private
    
    def set_published_at
      if published_changed?
        self.published_at = published ? Time.now : nil
      end
    end
  end
end
