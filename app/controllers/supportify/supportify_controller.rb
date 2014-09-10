module Supportify
  class SupportifyController < ApplicationController
  

    before_filter :set_locale


    protected
    
    def set_locale
      params[:locale] ||= I18n.default_locale 
      I18n.locale = params[:locale]
    end

    def supportify_user
      self.send(Supportify.current_user_method)
    end
  
  end
end