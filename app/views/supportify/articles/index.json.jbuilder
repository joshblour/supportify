json.array! @articles do |article|
  json.partial! 'supportify/articles/article', article: article
end