require 'rails_helper'
require 'values'

RSpec.describe Content, type: :model do
  it { should belong_to(:website) } 
  
  it { should validate_presence_of(:website) } 
  it { should validate_presence_of(:content) } 
  it { should validate_presence_of(:tag) } 

  it { should validate_inclusion_of(:tag).in_array(Values.available_tags) }
end
