class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text
      t.references :user, :prototype, foreign_key: true
      t.timestamps null: false
    end
  end
end
