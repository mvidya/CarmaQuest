class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.text :comment_user
    	t.integer :user_id
    	t.references :commentable, polymorphic: true, index: true
      
      t.timestamps null: false
    end
  end
end
