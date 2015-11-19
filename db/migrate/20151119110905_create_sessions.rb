class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
    	t.string :topic
    	t.text :description
    	t.integer :user_id
    	t.datetime :timing
    	t.integer :team_id
    	t.string :useful

      t.timestamps null: false
    end
  end
end
