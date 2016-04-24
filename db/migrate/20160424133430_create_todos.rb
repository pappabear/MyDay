class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :subject
      t.date :due_date
      t.integer :recurrence
      t.boolean :is_complete

      t.timestamps null: false
    end
  end
end
