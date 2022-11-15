class CreateTodoItems < ActiveRecord::Migration[6.1]
  def change
    create_table :todo_items do |t|
      t.string :title
      t.string :state
      t.datetime :deadline
      t.text :comment
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
