class AddPriceToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :price, :integer
  end
end
