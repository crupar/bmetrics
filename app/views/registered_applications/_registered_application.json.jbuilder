json.extract! registered_application, :id, :name, :url, :user_id, :created_at, :updated_at
json.url registered_application_url(registered_application, format: :json)