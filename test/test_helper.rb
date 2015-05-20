ENV["TASK_MANAGER_ENV"] ||= "test"

require File.expand_path("../../config/environment", __FILE__)
require "minitest/autorun"
require "minitest/pride"

class ModelTest < Minitest::Test 
  def teardown
    TaskManager.delete_all
  end
end


# 3 phases to testing

# - setup
#     - prepare the data that needs to exist for that test
# - execution
#     - perform certain pieces of functionality
# - verify
#     - check that you got the result you expected
# - teardown
#     - reset to original state