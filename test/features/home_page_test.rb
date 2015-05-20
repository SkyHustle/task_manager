require_relative "../test_helper"

class HomePageTest < FeatureTest
  def test_home_page_message
    visit "/"
    within(".intro-message") do
      assert page.has_content?("Task Manager")
      assert page.has_content?("Your To-Do's On One Page")
    end
  end
end