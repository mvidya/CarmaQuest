class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
			t.references :imageable, polymorphic: true, index: true
			t.attachment :image
			
      t.timestamps null: false
    end
  end
end
