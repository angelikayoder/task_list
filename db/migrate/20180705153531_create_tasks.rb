class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :position
      t.string :title
      t.boolean :is_done

      t.timestamps
    end
  end
end
