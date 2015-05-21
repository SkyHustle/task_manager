require_relative "../test_helper"

class EditTaskTest < FeatureTest
  def test_user_can_edit_existing_task
    TaskManager.create({ :title       => "Shopping",
                         :description => "Buy clothes"})
    visit "/tasks"
    click_link_or_button("Edit") # Ask!!
    assert "/tasks/1/edit", current_path # Ask Why test passes with or without 1

    fill_in("task[title]", :with => "Review")
    fill_in("task[description]", :with => "Go over classwork")
    click_link_or_button("submit")
    assert "/tasks", current_path

    assert page.has_content?("Review")
    refute page.has_content?("Blah")
  end
end