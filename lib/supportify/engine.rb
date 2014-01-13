require 'jquery-rails'
require 'carrierwave'
require 'ckeditor'
require 'cancan'
require 'simple_form'
require 'acts-as-taggable-on'
require 'select2-rails'
require 'pg_search'


module Supportify
  class Engine < ::Rails::Engine
    
    isolate_namespace Supportify
    
    initializer "supportify.assets.precompile" do |app|
      app.config.assets.precompile += %w(supportify.css supportify.js)
    end
    
    initializer 'supportify.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        helper Supportify::ApplicationHelper
      end
    end

  end
end
