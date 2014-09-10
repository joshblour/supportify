FactoryGirl.define do
  
  factory :article, class: Supportify::Article do 
    sequence(:title) {|n| "title #{n}"}
    sequence(:slug) {|n| "title #{n}"}
    locale 'en'
    body 'blah blah blah blah blah'
  end
  
end
