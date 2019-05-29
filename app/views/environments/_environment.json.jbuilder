json.extract! environment, :id, :name, :version, :git_hub_release, :url, :db_url, :db_user, :created_at, :updated_at
json.url environment_url(environment, format: :json)
