class AddPictureToLitposts < ActiveRecord::Migration[5.1]
  def change
    add_column :litposts, :picture, :string
  end
end
