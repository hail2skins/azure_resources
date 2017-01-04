json.extract! nsg, :id, :name, :resource_group, :location, :provisioning_state, :created_at, :updated_at
json.url nsg_url(nsg, format: :json)