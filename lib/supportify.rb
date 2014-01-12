require "supportify/engine"
require 'jquery-rails'

module Supportify
  mattr_accessor :author_class
  mattr_accessor :current_user_method
  mattr_accessor :user_admin_method
  mattr_accessor :locales
  
  def self.author_class
    @@author_class.constantize
  end
end
