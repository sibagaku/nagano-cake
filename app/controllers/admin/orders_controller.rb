class Admin::OrdersController < ApplicationController
    
    before_action :authenticate_admin!
    
    def show
        @order = Order.find(params[:id])
        @order_items = @order.order_items
    end
    
    def update
        @order = Order.find(params[:id])
        @order.update(status: params[:order][:status].to_i)
        redirect_to admin_order_path(@order.id)
    end
    
    private
    
    def order_params
        params.require(:order).permit(:status)
    end
end
