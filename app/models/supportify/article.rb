module Supportify
  class Article < ActiveRecord::Base
    include PgSearch
    pg_search_scope :text_search, 
      against: {
        title: 'A',
        categories: 'B',
        tags: 'C',
        body: 'D'
      }, 
      :using => {
        :tsearch => {:dictionary => "english"}
      }
    
    before_save :set_published_at
    after_create :create_for_other_locales
        
    belongs_to :author, class_name: Supportify.author_class.to_s
    
    mount_uploader :image, ArticleImageUploader
    
    validates :title, :slug, :locale, :body, presence: true
    validates :slug, uniqueness: true
    validates :locale, inclusion: Supportify.locales.map(&:to_s)
    
    scope :published, -> {where('published_at IS NOT null')}
    scope :by_text, -> (term) {text_search term}
    
    [:tags, :categories, :admin_tags].each do |t|
      scope "by_#{t}", -> (*tags) {where("#{t} && ARRAY[?]::varchar[]", tags.flatten)}
      
      define_method "#{t.to_s.singularize}_list" do
        self.send(t).join(', ')
      end
      
      define_method "#{t.to_s.singularize}_list=" do |string|
        assign_attributes(t => string.split(',').map(&:strip))
      end
    end
    
    private
    
    def create_for_other_locales
      #TODO
    end
    
    def set_published_at
      if published_changed?
        self.published_at = published ? Time.now : nil
      end
    end
  end
end
