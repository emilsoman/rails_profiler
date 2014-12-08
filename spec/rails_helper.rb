# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
ENV["RAILS_ROOT"] = File.expand_path("../dummy", __FILE__)
require 'spec_helper'
require File.expand_path("../dummy/config/environment", __FILE__)

require 'rspec/rails'

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
end
