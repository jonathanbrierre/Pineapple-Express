class ReviewsController < ApplicationController

    def history
        @items = my_unique_items(current_user)
    end

    def new
        # byebug
        @item = Item.find(params[:id])
        @review = Review.new
        # @items = my_unique_items(current_user).map{|cart_item| cart_item.item}
    end

    def create 
        # byebug
        @review = Review.create(strong_params)
        @review.update(user_id: current_user.id)
        # byebug
        if !@review.valid?
            flash[:errors] = @review.errors.full_messages
            redirect_to "/cart_items/reviews/#{strong_params[:item_id]}/new" and return
        else
            flash[:notice] = 'Successfully created a review!'
            redirect_to "/items/#{strong_params[:item_id]}" and return
        end

    end


    private

    def strong_params
        params.require(:review).permit(:rating, :feedback, :item_id)
    end

    def find_id_w_name(item_name)
        @item = Item.all.find_by(name: item_name)
        @item_id = @item.id
    end

    def my_items(current_user)
        CartItem.bought_items(current_user) #selects all of a user's checked-out cart_items (w/ boolean true)
    end

    def my_unique_items(current_user)
        @items = my_items(current_user).uniq{|cart_item| cart_item.item_id}
        
    end
end
