class AddImageToContact < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :image_url, :string
  end
end
