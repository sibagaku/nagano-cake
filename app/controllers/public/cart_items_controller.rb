class Public::CartItemsController < ApplicationController
    def index
        @cart_items = current_customer.cart_items
        @total = 0
    end
    
    def create
        @cart_item = CartItem.new(cart_item_params)
        @cart_item.customer_id = current_customer.id
        cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id], customer_id:current_customer.id)
        if  cart_item
            #viewで表示する個数=現在のカートにある個数+新しく追加する個数
            new_amount = cart_item.amount + @cart_item.amount
            cart_item.update_attribute(:amount, new_amount)
            @cart_item.delete
            redirect_to cart_items_path
        else
            @cart_item.save
            redirect_to cart_items_path
        end
    end
    
    def update
        @cart_item = CartItem.find(params[:id])
        @cart_item.update(cart_item_params)
        redirect_to cart_items_path
    end
    
    def destroy
        cart_item = CartItem.find(params[:id])
        cart_item.destroy
        redirect_to cart_items_path
    end
    
    def destroy_all
        cart_items = current_customer.cart_items
        cart_items.destroy_all
        redirect_to cart_items_path
    end
    
    private
    
    def cart_item_params
        params.require(:cart_item).permit(:item_id, :amount)
    end
end
