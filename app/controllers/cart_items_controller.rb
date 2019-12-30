class CartItemsController < ApplicationController
    skip_before_action :verify_authenticity_token
    #columns: user_id, item_id, bought(boolean), quantity
    def index
        
        @user_items = session_items(current_user)
    end

    def new
        @cart_item = CartItem.new
    end

    def create
        # byebug
        # 1 - maps out all item_id's attatched to every one of a user's cart_items.
        # 2 - sees if the new request contains a new item_id
        # 3 - If the newly introduced item_id already exists within the cart, then there is a check to see if 
        # there is a cart item with the same id and same size. 
        # 4 - if the above checks true, then the quantity is updated
            item_id_array = session_items(current_user).map {|user_item| user_item.item_id}
            if item_id_array.include?(strong_params[:item_id].to_i)
                single_item_array = session_items(current_user).select{|item| item.item_id == strong_params[:item_id].to_i}
                if single_item_array.find{|item| item.size== strong_params[:size]}
                    single_item = single_item_array.find{|item| item.size== strong_params[:size]}
                    single_item.update(quantity: single_item[:quantity].to_i + strong_params[:quantity].to_i)
                    flash[:notice] = "Successfully updated item in cart!"
                    redirect_to "/items/#{strong_params[:item_id]}" and return
                end
            end
        # 1 - if the request contains an item_id that is not associated with any of a 
        #     user's cart_items, an attempt is made at creating a new CartItem db entry.
        # 2 - the attempt is validated and sends an appropriate message to the user
            @cart_item = CartItem.create(strong_params)
            @cart_item.update(user_id: current_user.id, bought: false)
            if @cart_item.valid?
                flash[:notice] = "Successfully added item to cart"
                redirect_to "/items/#{strong_params[:item_id]}" and return
            else
                flash[:notice] = @cart_item.errors.full_messages[0]
                redirect_to "/items/#{strong_params[:item_id]}" and return
            end
            

    end

    def edit
    end

    def update
        # byebug

        @cart_item = CartItem.find_by(id: params[:id])
        if strong_params[:quantity].to_i > 0
            @cart_item.update(strong_params)
            flash[:notice]= "Successful quantity change!"
        else
            flash[:notice] = "Quantity must be greater than 0"
        end
        redirect_to cart_items_path
    end

    def destroy ########### why this work weird?
        # byebug
        @user_item = CartItem.find_by(id: params[:id])
        @user_item.destroy
        flash[:notice] = "Successfully deleted item!"
        redirect_to cart_items_path
    end

    def checkout
        #changes all cart items associated with a user's session to have a boolean of true - now accessible in Purchase history
        session_items(current_user).each {|cart_item| cart_item.update(bought: true)}
        flash[:notice] = 'You bought all the items! Check your history and write a review 😜'
        redirect_to "/cart_items"
    end

    private

    def strong_params
        # byebug
        params.require(:cart_item).permit(:id, :item_id, :quantity, :bought, :size)
    end 

    def session_items(current_user)
        CartItem.user_items(current_user) #selects all of a user's cart_items
    end
end
