ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'coveralls'

Coveralls.wear!

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
end
