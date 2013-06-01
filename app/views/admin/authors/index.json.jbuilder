json.array!(@admin_authors) do |admin_author|
  json.extract! admin_author, :first_name, :last_name
  json.url admin_author_url(admin_author, format: :json)
end