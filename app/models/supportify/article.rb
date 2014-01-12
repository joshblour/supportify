module Supportify
  class Article < ActiveRecord::Base
    before_save :set_published_at
    belongs_to :author, class_name: Supportify.author_class.to_s
    
    private
    
    def set_published_at
      if published_changed?
        self.published_at = published ? Time.now : nil
      end
    end
  end
end
