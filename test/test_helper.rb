ENV["TASK_MANAGER_ENV"] ||= "test"

require File.expand_path("../../config/environment", __FILE__)
require "minitest/autorun"
require "minitest/pride"
require "capybara"
require "tilt/erb"
require "pry"

class Minitest::Test 
  def teardown
    TaskManager.delete_all
  end
end

# Only for Sinatra Apps
Capybara.app = TaskManagerApp

class FeatureTest < Minitest::Test
  include Capybara::DSL
end