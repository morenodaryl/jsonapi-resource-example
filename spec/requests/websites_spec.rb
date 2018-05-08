require 'rails_helper'

RSpec.describe "Websites", type: :request do

  let (:headers) { {Accept: ' application/vnd.api+json', 'Content-Type': 'application/vnd.api+json'} }

  describe "GET /websites" do

    it "get a website in websites list" do
      website = create :static_website
      get api_v1_websites_path

      expect(response).to have_http_status(200)
      parsed_body = JSON.parse(response.body);
      expect(parsed_body['data'].length).to eq(1)
      expect(parsed_body['data'][0]['attributes']['url']).to eq(website.url)
    end

    it 'get 10 websites' do
      create_list :website, 10
      get api_v1_websites_path
      expect(response).to have_http_status(200) 
      parsed_body = JSON.parse(response.body);
      expect(parsed_body['data'].length).to eq(10)
    end

    it 'get a single website' do 
      website = create :static_website 
      get api_v1_website_path(website)
      parsed_body = JSON.parse(response.body) 
      expect(parsed_body['data']['id'].to_i).to eq(website.id)
      expect(parsed_body['data']['attributes']['url']).to eq(website.url)
    end 

  end

  describe 'POST /websites' do 
    let (:website) { build :static_website }
    let (:data) { {data: { type: 'websites', attributes: {url: website.url} } } } 

    context 'correct params' do 

      it 'creates a new website' do 
        expect{
          post api_v1_websites_path, params: data.to_json, headers: headers
        }.to change(Website, :count).by(1)

        expect(response).to have_http_status(:created)
        parsed_body = JSON.parse(response.body);
        expect(parsed_body['data']['attributes']['url']).to eq(website.url)
      end

    end

    context 'wrong params' do 

      it 'does not create a new website with empty url' do 
        data[:data][:attributes][:url] = ''

        expect{
          post api_v1_websites_path, params: data.to_json, headers: headers
        }.to change(Website, :count).by(0)

        expect(response).to have_http_status(:unprocessable_entity)
      end 

      it 'does not create a new website with 3 url length' do 
        data[:data][:attributes][:url] = '123'

        expect{
          post api_v1_websites_path, params: data.to_json, headers: headers
        }.to change(Website, :count).by(0)

        expect(response).to have_http_status(:unprocessable_entity)
      end 

    end 
  end

  describe 'PUT /websites' do 
    let (:old_website) { create :static_website }
    let (:website) { build :website }
    let (:data) { {data: { type: 'websites', attributes: {url: website.url}, id: old_website.id } } } 

    context 'correct params' do 

      it 'updates a website' do 
        put api_v1_website_path(old_website), params: data.to_json, headers: headers

        expect(response).to have_http_status(:ok)
        parsed_body = JSON.parse(response.body);
        expect(parsed_body['data']['attributes']['url']).to eq(website.url)
      end

    end

    context 'wrong params' do 

      it 'does not update a website with empty url' do 
        data[:data][:attributes][:url] = ''
        put api_v1_website_path(old_website), params: data.to_json, headers: headers

        expect(response).to have_http_status(:unprocessable_entity)
      end 

      it 'does not update a website with 3 url length' do 
        data[:data][:attributes][:url] = '123'
        put api_v1_website_path(old_website), params: data.to_json, headers: headers

        expect(response).to have_http_status(:unprocessable_entity)
      end 

    end 
  end

  describe "DELETE /websites" do
    let (:website) { create :static_website }

    it 'Destroys a website' do 
      delete api_v1_website_path(website)

      expect(Website.count).to eq(0)
      expect(response).to have_http_status(:no_content)
    end 
  end 
    
end
