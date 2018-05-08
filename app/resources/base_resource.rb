class BaseResource < JSONAPI::Resource
  abstract

  def self.default_attribute_options
    {format: :my_default}
  end
end