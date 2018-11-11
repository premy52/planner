json.extract! article, :id, :caption, :pub_year, :pub_month, :publication_id, :topic_id, :super_topic_id, :link, :created_at, :updated_at
json.url article_url(article, format: :json)
