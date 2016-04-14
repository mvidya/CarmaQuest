class CreateSeminars < ActiveRecord::Migration
  def change
    create_table :seminars do |t|
      t.string :title
      t.datetime :seminar_time
      t.string :references
      t.integer :user_id
    	t.integer :team_id
    	t.integer :document_id
      t.timestamps null: false
    end
  end
end
