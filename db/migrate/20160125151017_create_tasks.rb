class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string  :content
      t.integer  :finished, :null => true
      t.datetime :start_date, :null => true
      t.datetime :finish_date, :null => true
      t.references :board, index: true
      t.timestamps null: false
    end
  end
end
