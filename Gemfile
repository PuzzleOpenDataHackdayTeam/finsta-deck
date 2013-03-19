source 'https://rubygems.org'

gem 'rails', '3.2.12'

gem 'thin'
gem 'slim'
gem 'activerecord-import'
gem 'geocoder'
gem 'rails_config'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3'
  gem 'rb-fsevent', require: RUBY_PLATFORM.include?('darwin') && 'rb-fsevent'
  gem 'rb-inotify', '~> 0.8.8', require: RUBY_PLATFORM.include?('linux') && 'rb-inotify'
  gem 'quiet_assets'
  gem 'better_errors'
  gem 'pry'
  gem 'pry-debugger'
  gem 'pry-doc'
  gem 'pry-nav'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'spring'
end


group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'rickshaw_rails'
  gem 'sass-rails',   '~> 3.2.3'
  gem 'jquery-rails'
  gem 'jquery_mobile_rails'
  gem 'uglifier', '>= 1.0.3'
end
