json.articles do
  json.array! @articles do |article|
    json.partial! 'supportify/articles/article', article: article, truncate_body: true
  end
end