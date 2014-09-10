require "supportify/engine"

module Supportify
  mattr_accessor :author_class
  mattr_accessor :current_user_method
  mattr_accessor :locales
  mattr_accessor :file_storage
  
  def self.author_class
    @@author_class.constantize
  end
end
