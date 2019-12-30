class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :quantity, numericality: {greater_than: 0}

  def self.user_items(current_user)
    self.all.select{|cart_item| cart_item.user_id == current_user.id && cart_item.bought == false }
  end

  def self.bought_items(current_user)
    self.all.select{|cart_item| cart_item.user_id == current_user.id && cart_item.bought == true }
  end
end
