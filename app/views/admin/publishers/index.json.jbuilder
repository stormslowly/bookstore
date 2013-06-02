json.array!(@admin_publishers) do |admin_publisher|
  json.extract! admin_publisher, :name
  json.url admin_publisher_url(admin_publisher, format: :json)
end