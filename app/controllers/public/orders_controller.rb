class Public::OrdersController < ApplicationController
    
    before_action :authenticate_customer!
    before_action :correct_user, only: [:show]
    
    def new
        @order = Order.new
    end
    
    def create
        @order = Order.new(order_params)
        @order.customer_id = current_customer.id
        if @order.save
        cart_items = current_customer.cart_items
        cart_items.each do |cart_item|
            order_item = OrderItem.new
            order_item.item_id = cart_item.item_id
            order_item.amount = cart_item.amount
            order_item.order_id = @order.id
            order_item.price = cart_item.subtotal
            order_item.save
        end
        current_customer.cart_items.delete_all
        redirect_to complete_path
        else
            render:new
        end
    end
    
    def confirm
        @order = Order.new(order_params)
        if params[:order][:select_address] == "0"
            @order.delivery_postal_code = current_customer.postal_code
            @order.delivery_address = current_customer.address
            @order.delivery_name = current_customer.full_name
        elsif params[:order][:select_address] == "1"
            @address = Address.find(params[:order][:address_id])
            @order.delivery_postal_code = @address.postal_code
            @order.delivery_address = @address.address
            @order.delivery_name = @address.name
        else
            
        end
        @cart_items = current_customer.cart_items
        @total = 0
        @postage = 800
    end
    
    def index
        @orders = current_customer.orders
    end
    
    def show
        @order = Order.find(params[:id])
        @order_items = @order.order_items
    end
    
    private
    
    def order_params
        params.require(:order).permit(:payment_method, :payment, :status, :postage, :customer_id, :delivery_postal_code, :delivery_address, :delivery_name)
    end
    
    def correct_user
        @order = Order.find(params[:id])
        @customer = @order.customer
        redirect_to(orders_path) unless @customer == current_customer
    end
end
