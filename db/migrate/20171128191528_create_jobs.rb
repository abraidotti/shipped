class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :name
      t.string :description
      t.string :origin
      t.string :destination
      t.decimal :cost
      t.integer :containers_needed

      t.timestamps
    end
    add_index :jobs, :name, unique: true
  end
end
