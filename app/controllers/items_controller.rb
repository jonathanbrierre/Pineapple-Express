class ItemsController < ApplicationController
    skip_before_action :authorized, only:[:index, :shirts, :pants, :hats, :about]

    def index
        @items = Item.all
    end

    def show
        @item = Item.find(params[:id])
        @cart_item = CartItem.new
    end

    def about
    end

    def shirts
        @shirts = Item.shirts
    end

    def pants
        @pants = Item.pants
    end

    def hats
        @hats = Item.hats
    end
end
