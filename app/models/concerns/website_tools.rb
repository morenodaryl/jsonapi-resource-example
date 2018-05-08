require 'values'
module WebsiteTools
  extend ActiveSupport::Concern

  def tag_list 
    Values.available_tags
  end 

  module ClassMethods
    def tag_list
        return Values.available_tags
    end 
  end 

end 