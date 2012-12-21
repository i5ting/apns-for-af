class CreatePems < ActiveRecord::Migration
  def change
    create_table :pems do |t|
      t.string :name
      t.string :filepath
      t.string :desc
      t.integer :project_id

      t.timestamps
    end
  end
end
