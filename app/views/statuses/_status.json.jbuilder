json.extract! status, :id, :name, :deleted_at, :created_at, :updated_at
json.url status_url(status, format: :json)
