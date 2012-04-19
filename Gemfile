source 'http://rubygems.org'

gem 'rails', '3.2.1'

# Bundle edge Rails instead:
#gem 'activeadmin'

gem 'mysql2'

gem 'haml'
gem 'haml-rails', :group => :development
gem 'json'
gem 'execjs'
gem 'therubyracer'

gem 'meta_search', '>= 1.1.0.pre'
gem 'sass-rails', '~> 3.2.3'


group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'


# Deploy with Capistrano
gem 'capistrano'
gem 'rvm-capistrano'

group :test do
  gem 'database_cleaner'
  gem 'rails3-generators'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'cucumber-rails'
  gem 'email_spec'
  gem 'capybara'
  gem 'turn', '< 0.8.3'
end

group :development do
  gem 'annotate', '~> 2.4.1.beta' 
end

group :development, :test, :cucumber do
  # To use debugger
  gem 'ruby-debug19', :require => 'ruby-debug'
end
