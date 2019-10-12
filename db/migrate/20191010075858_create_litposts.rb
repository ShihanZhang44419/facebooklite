class CreateLitposts < ActiveRecord::Migration[5.1]
  def change
    create_table :litposts do |t|
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :litposts, [:user_id, :created_at]
  end
end
