require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  def test_it_creates_a_task
    TaskManager.create({ :title       => "a title", 
                         :description => "a description"})
    task = TaskManager.find(TaskManager.all.last.id)
    assert_equal "a title", task.title
    assert_equal "a description", task.description
    assert_equal TaskManager.all.last.id, task.id
  end

  def test_it_shows_all_tasks_in_repo
    TaskManager.create({ :title       => "a title", 
                         :description => "a description"})
    assert_equal 1, TaskManager.all.count
  end

  def test_it_can_find_a_task_by_id
    TaskManager.create({ :title          => "homework", 
                         :description => "do homework"})
    task = TaskManager.find(TaskManager.all.last.id)
    assert_equal "homework", task.title
  end

  def test_it_can_update_a_task
    TaskManager.create({ :title       => "homework", 
                         :description => "do homework"})
    task = TaskManager.all.last
    assert_equal "homework", task.title
    assert_equal "do homework", task.description

    TaskManager.update(task.id, { :title       => "shopping", 
                     :description => "go shopping"})
    task = TaskManager.all.last
    assert_equal "shopping", task.title
    assert_equal "go shopping", task.description    
  end

  def test_it_can_destroy_a_task
    TaskManager.create({ :title       => "homework", 
                         :description => "do homework"})
    assert_equal 1, TaskManager.all.count
    TaskManager.destroy(TaskManager.all.last.id)
    assert_equal 0, TaskManager.all.count
  end
end