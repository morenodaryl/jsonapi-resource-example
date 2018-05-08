source 'https://rubygems.org'

git_source(:github) do |repo_name|    
  
end

gem 'rails', '~> 5.1.4'
gem 'sqlite3'
gem 'puma', '~> 3.7'

gem 'jsonapi-resources'
gem 'nokogiri'

group :test do
  gem 'shoulda-matchers', '~> 3.1'
  gem 'database_cleaner'
end

group :development, :test do  
  gem "factory_bot_rails", "~> 4.0"
  gem 'rspec-rails', '~> 3.6'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'  
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
