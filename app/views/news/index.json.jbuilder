json.array!(@news) do |news|
  json.extract! news, :user_id, :title, :desc, :news_image, :published, :featured, :hits
  json.url news_url(news, format: :json)
end
