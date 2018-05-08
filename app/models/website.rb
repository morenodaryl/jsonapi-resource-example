require 'regex_validators'
require 'open-uri'
class Website < ApplicationRecord
    has_many :contents, dependent: :destroy

    attr_accessor :doc

    include WebsiteTools

    validates :url, presence: :true, 
                    format: { with: RegexValidators.url}, 
                    length: { minimum:4, maximum: 2000}, 
                    uniqueness: :true
                    
    validate :validate_website
    before_save :set_website_tags

    accepts_nested_attributes_for :contents, reject_if: :all_blank
    
    private 
    def validate_website
        self.doc = Nokogiri::HTML(open(self.url)) rescue nil
        if self.doc.nil? 
            self.errors.add(:url, 'the website is not available') # if the document doesn't exists
        end
    end

    def set_website_tags 
        Content.where(website_id: self.id).destroy_all unless self.id.nil?
        if self.doc.present?
            tag_list.each do |tag| # tag_list is declared in WebsiteTools
                self.doc.search(tag).each do |title|
                    content = title.key?('href')? title[:href].strip : title.content.strip # take the content if it's a title, if not take the href
                    self.contents.build(tag: tag, content: content)
                end 
            end
        end     
    end 
    
end
