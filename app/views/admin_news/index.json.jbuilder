json.array!(@admin_news) do |admin_news|
  json.extract! admin_news, :id, :title, :text, :published, :hits, :created_by
  json.url admin_news_url(admin_news, format: :json)
end
