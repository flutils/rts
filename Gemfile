########################################
########################################

# => Sources
source 'https://rubygems.org'
source 'https://rails-assets.org' # => (Heroku) https://github.com/tenex/rails-assets/issues/325

########################################
########################################

# => Ruby
# => https://github.com/cantino/huginn/blob/master/Gemfile#L4
ruby [RUBY_VERSION, '2.6.0'].min

# => Rails
gem 'rails', '~> 5.2', '>= 5.2.1'

# => Server
# => Default dev development for Rails 5 but still needs the gem....
# => https://richonrails.com/articles/the-rails-5-0-default-files
gem 'puma', groups: [:development, :staging] # => Production will use phusion with nginx

# => DB
# => https://github.com/rrrene/projestimate/blob/master/Gemfile#L11
gem 'sqlite3', group: :development
gem 'pg',      group: :staging
gem 'mysql2',  group: :production

########################################
########################################

# Platform Specific
# http://bundler.io/v1.3/man/gemfile.5.html#PLATFORMS-platforms-

# => Win
gem 'tzinfo-data' if Gem.win_platform? # => TZInfo For Windows

# => Not Windows
unless Gem.win_platform?
  gem 'execjs'       		# => http://stackoverflow.com/a/6283074/1143732
  gem 'mini_racer' 		  # => http://stackoverflow.com/a/6283074/1143732
end

########################################
########################################

####################
#     Frontend     #
####################

## HAML & SASS ##
gem 'sass-rails', '~> 5.0', '>= 5.0.7'
gem 'uglifier', '~> 3.0'
gem 'haml', '~> 5.0', '>= 5.0.3'

## JS ##
gem 'coffee-rails', '~> 4.2', '>= 4.2.1'
gem 'jquery-rails'
gem 'turbolinks', '~> 5.0'
gem 'jbuilder', '~> 2.0'

########################################
########################################

####################
#     Backend      #
####################

## General ##
gem 'devise',           '~> 4.5'              # => Devise (athentication)
gem 'activeadmin',      '~> 1.4', '>= 1.4.3'  # => ActiveAdmin (administration system)
gem 'image_processing', '~> 1.7', '>= 1.7.1'  # => ImageProcessing (for Trix etc)
gem 'friendly_id',      '~> 5.2', '>= 5.2.5'  # => FriendlyID, although I don't think we'll need it

## Assets ##
gem 'webpacker', '~> 4.0.0.rc.2'              # => WebPacker (allows us to build assets on front-end)

########################################
########################################
