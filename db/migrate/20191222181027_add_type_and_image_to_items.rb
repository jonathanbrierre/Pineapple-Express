class AddTypeAndImageToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :clothing_type, :string
    add_column :items, :img_url, :string
  end
end
