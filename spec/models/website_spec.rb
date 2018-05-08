require 'rails_helper'

RSpec.describe Website, type: :model do
  it { should have_many(:contents) } 
  it { should accept_nested_attributes_for(:contents) }
  it { should validate_presence_of(:url) }
  it { should validate_length_of(:url).is_at_least(4).is_at_most(2000) }
  it { should validate_uniqueness_of(:url) }
  it { should allow_value('https://www.google.com').for(:url) }
  it { should_not allow_value('random text').for(:url) }

  it 'should get a h1, h2, h3 and a link' do
    path = Rails.root.join('public','static_page.html').to_path
    website = create :static_website
    expect(Website.count).to eq(1)
    expect(Content.count).to eq(4)
    expect(Content.find_by_tag('h1').content).to eq('main title h1')
    expect(Content.find_by_tag('h2').content).to eq('title h2')
    expect(Content.find_by_tag('h3').content).to eq('third title')
    expect(Content.find_by_tag('a').content).to eq('/myhref')
  end
end
