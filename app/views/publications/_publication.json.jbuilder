json.extract! publication, :id, :pub_name, :client_id, :created_at, :updated_at
json.url publication_url(publication, format: :json)
