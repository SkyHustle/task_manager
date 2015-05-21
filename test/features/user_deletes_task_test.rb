require_relative "../test_helper"

class DeletingTaskTest < FeatureTest
  def test_it_can_delete_a_task
    TaskManager.create({ :title       => "Shopping",
                         :description => "Buy clothes"})
    visit "/tasks"
    assert page.has_content?("Shopping")
    click_link_or_button("Delete")
    assert "/tasks", current_path
    refute page.has_content?("Shopping")
  end
end