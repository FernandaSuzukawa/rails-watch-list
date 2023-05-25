json.extract! movie, :id, :title, :overview, :porter_url, :rating, :created_at, :updated_at
json.url movie_url(movie, format: :json)
