FactoryBot.define do
  factory :website do
    url { 'https://www.darylmoreno.me#' + SecureRandom.hex }
    factory :static_website do
      url Rails.root.join('public', 'static_page.html')
    end 
  end
end