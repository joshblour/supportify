module Supportify
  class SupportifyController < ApplicationController
  

    before_filter :set_locale

    helper_method :current_ability


    rescue_from CanCan::AccessDenied do |exception|
  
      if request.xhr?
        render json: { error: exception.message }
      else
        flash[:alert] = exception.message
  
        redirect_to root_url, status: :unauthorized
      end
    end

    protected
    
    def set_locale
      params[:locale] ||= I18n.default_locale 
      I18n.locale = params[:locale]
    end

    def supportify_user
      self.send(Supportify.current_user_method)
    end
  
    def current_ability
      @current_ability ||= Supportify::Ability.new(supportify_user)
    end
  end
end