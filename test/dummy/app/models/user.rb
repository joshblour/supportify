class User < ActiveRecord::Base
  attr_accessor :full_name
  
  def admin?
    role == 'admin'
  end
end
