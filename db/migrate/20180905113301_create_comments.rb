class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :prototype_id
      t.integer :captured_image_id
      t.text :text
      t.timestamps
    end
  end
end
