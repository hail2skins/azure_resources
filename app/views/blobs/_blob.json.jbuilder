json.extract! blob, :id, :name, :last_modified, :length, :created_at, :updated_at
json.url blob_url(blob, format: :json)