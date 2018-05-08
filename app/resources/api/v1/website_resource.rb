class Api::V1::WebsiteResource < BaseResource
    has_many :contents
    
    attributes :url, :created_at, :updated_at

    filters :url

end
