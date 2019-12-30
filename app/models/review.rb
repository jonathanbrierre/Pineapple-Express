class Review < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :rating, numericality: {greater_than: 0, less_than_or_equal_to: 5}
  validates :feedback, length: {minimum: 15, maximum: 500}
end
