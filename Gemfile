source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.5'
gem 'rails', '~> 5.2.4.1'

gem 'puma', '~> 3.12'
gem 'uglifier'
gem 'recaptcha', require: 'recaptcha/rails'
gem "nokogiri", ">= 1.10.8"
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'sqlite3', '< 1.4'
end

group :production do
  gem 'pg', '~> 0.21'
end
