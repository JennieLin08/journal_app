class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.integer :category_id
      t.string :desc
      t.date :deadline
      t.string :status

      t.timestamps
    end
  end
end
