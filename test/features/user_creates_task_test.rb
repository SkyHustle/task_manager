require_relative "../test_helper"

class NewTaskTest < FeatureTest

  def test_user_can_successfully_fill_out_form
    visit "/tasks/new"
    fill_in("task[title]", :with => "Homework")
    fill_in("task[description]", :with => "Do Homework!")
    click_link_or_button("submit")
    assert_equal "/tasks", current_path
    within(".tasks li:first") do
      assert page.has_content?("Homework")
    end
  end
end
