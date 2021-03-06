source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.8'

# Database and data related
gem 'pg'
gem 'postgres-copy'
gem 'schema_plus'
gem 'schema_associations'

# Frontend stuff
gem 'slim-rails'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'backbone-on-rails'
gem 'bootstrap_form'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'sass-rails'
gem 'coffee-rails'
gem 'uglifier'
gem "compass-rails"
gem "nested_form"
#gem 'jquery-fileupload-rails'
gem 'gon'

# Authentication
gem 'devise'

# HTML manipulation and formatting
gem 'formtastic'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# State machine for attributes on models
gem 'state_machine', require: 'state_machine/core'

gem 'carrierwave'

gem 'carrierwave_direct'

# Gem used to handle image uploading
gem 'fog', '>= 1.3.1'
  
gem 'sidekiq'

gem 'cancan'

gem 'country_select'

gem 'inherited_resources',        '1.6.0'

gem 'has_scope', '0.6.0'

gem 'rubyzip'

gem 'rake', '< 11.0'

gem 'rails-i18n'


group :test, :development do
  gem 'rspec-rails'
end

group :test do
  gem 'launchy'
  gem 'database_cleaner'
  gem 'shoulda'
  gem 'factory_girl_rails'
  gem 'capybara',   '~> 2.0.2'
  gem 'jasmine'
  gem 'coveralls', require: false
  gem "selenium-webdriver", "~> 2.34.0"
end

group :production do

  # Workers, forks and all that jazz
  gem 'unicorn'

  # Enabling Gzip on Heroku
  # If you don't use Heroku, please comment the line below.
  gem 'heroku-deflater', '>= 0.4.1'


  # Monitoring with the new new relic
  gem 'newrelic_rpm'

  gem 'rails_12factor'
  
  # Using dalli and memcachier have not presented significative performance gains
  # Probably this is due to our pattern of cache usage
  # + the lack of concurrent procs in our deploy
  #gem 'memcachier'
  #gem 'dalli'
end


# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin]