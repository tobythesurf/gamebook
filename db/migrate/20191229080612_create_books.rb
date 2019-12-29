class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :book_title, null:false
      t.text :description, null:false
      t.text :introduction, null:false
      t.boolean :user_permission, default:false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
