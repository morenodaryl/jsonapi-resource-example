class Content < ApplicationRecord
  belongs_to :website

  include WebsiteTools
  
  validates :tag, presence: :true, inclusion: { in: tag_list }
  validates :content, presence: :true
  validates :website, presence: true
end
