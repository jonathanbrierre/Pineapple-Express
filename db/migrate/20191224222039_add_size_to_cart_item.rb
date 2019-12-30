class AddSizeToCartItem < ActiveRecord::Migration[6.0]
  def change
    add_column :cart_items, :size, :string
  end
end
