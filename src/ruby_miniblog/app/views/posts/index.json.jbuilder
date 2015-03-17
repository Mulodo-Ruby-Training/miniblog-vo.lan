json.array!(@posts) do |post|
  json.extract! post, :id, :title, :content, :image, :description, :user_id, :status
  json.url post_url(post, format: :json)
end
