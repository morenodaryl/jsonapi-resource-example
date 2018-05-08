class Api::V1::ContentResource < BaseResource
    immutable
    
    attributes :tag, :content, :created_at, :updated_at, :website

    def website
        @model.website.url
    end
    
    def custom_links(options)
        {self: nil}
    end
end
