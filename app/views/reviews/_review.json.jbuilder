json.extract! review, :id, :comentario, :nota, :data_criacao, :created_at, :updated_at
json.url review_url(review, format: :json)
