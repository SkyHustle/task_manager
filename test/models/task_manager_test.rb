require_relative '../test_helper'

class TaskManagerTest < ModelTest
  def test_it_creates_a_task
    TaskManager.create({ :title       => "a title", 
                         :description => "a description"})
    task = TaskManager.find(1)
    assert_equal "a title", task.title
    assert_equal "a description", task.description
    assert_equal 1, task.id
  end

  def test_it_shows_all_tasks_in_repo
    TaskManager.create({ :title       => "a title", 
                         :description => "a description"})
    TaskManager.create({ :title       => "a title1", 
                         :description => "a description1"})
    tasks = TaskManager.all
    assert_equal 2, tasks.count
    assert_equal "a title", tasks[0].title
  end

  def test_it_can_find_a_task_by_id
    TaskManager.create({ :title          => "homework", 
                         :description => "do homework"})
    TaskManager.create({ :title          => "haircut", 
                         :description => "get haircut"})
    task = TaskManager.find(1)
    task1 = TaskManager.find(2)
    assert_equal 1, task.id
    assert_equal "homework", task.title
    assert_equal "get haircut", task1.description
  end

  def test_it_can_update_a_task
    TaskManager.create({ :title       => "homework", 
                         :description => "do homework"})
    task = TaskManager.find(1)
    assert_equal "homework", task.title
    assert_equal "do homework", task.description

    TaskManager.update(1, { :title       => "shopping", 
                     :description => "go shopping"} )
    task = TaskManager.find(1)
    assert_equal "shopping", task.title
    assert_equal "go shopping", task.description    
  end

  def test_it_can_destroy_a_task
    TaskManager.create({ :title       => "homework", 
                         :description => "do homework"})
    assert_equal 1, TaskManager.all.count

    TaskManager.destroy(1)
    assert_equal 0, TaskManager.all.count
  end
end




