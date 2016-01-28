class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.integer :user_id, :null => true
      t.string :name
      t.integer :tasks_count
      t.timestamps null: false
    end
    add_index :boards, :user_id
  end
end
