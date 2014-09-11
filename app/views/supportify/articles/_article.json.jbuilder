json.id article.id
json.title article.title
json.slug article.slug
json.locale article.locale
json.tags article.tags
json.categories article.categories
json.admin_tags article.admin_tags
json.published_at article.published_at

if defined? truncate_body && truncate_body == true
  json.body article.body.truncate(200)
  json.truncated article.body.length > 200
else
  json.body article.body
  json.truncated false
end

json.updated_at article.updated_at
json.created_at article.created_at
