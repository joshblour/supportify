Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'#, at: 'ckeditor'

  mount Supportify::Engine => "/supportify"
end
