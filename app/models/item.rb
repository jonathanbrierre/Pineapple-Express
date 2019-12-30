class Item < ApplicationRecord
    has_many :reviews, dependent: :destroy  
    has_many :cart_items, dependent: :destroy  
    has_many :users, through: :reviews

    def self.pants
        self.all.select{|item| item.clothing_type == 'pants'}
    end
    
    def self.shirts
        self.all.select{|item| item.clothing_type == 'shirt'}
    end

    def self.hats
        self.all.select{|item| item.clothing_type == 'hat'}
    end
end
