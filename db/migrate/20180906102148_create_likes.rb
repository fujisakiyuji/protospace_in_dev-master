class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer   :user
      t.integer   :prototype
      t.timestamps
    end
  end
end
