class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.string :name
      t.string :desc
      t.integer :project_id

      t.timestamps
    end
  end
end
