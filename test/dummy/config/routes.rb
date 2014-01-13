Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  mount Supportify::Engine => "/supportify"
end
