class Admin::OrderItemsController < ApplicationController
    
    before_action :authenticate_admin!
    
    def update
        @order = Order.find(params[:id])
        @order_item = OrderItem.find(params[:id])
        @order_item.update(making_status: params[:order_item][:making_status].to_i)
        redirect_to admin_order_path(@order.id)
    end
end
