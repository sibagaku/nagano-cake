class Public::AddressesController < ApplicationController
    
    before_action :authenticate_customer!
    before_action :correct_user, only: [:edit, :update, :destroy]
    
    def index
        @addresses = current_customer.addresses
        @address = Address.new
    end
    
    def create
        @address = Address.new(address_params)
        @address.customer_id = current_customer.id
        if @address.save
            redirect_to addresses_path
        else
            @addresses = Address.all
            render:index
        end
    end
    
    def edit
        @address = Address.find(params[:id])
    end
    
    def update
        @address = Address.find(params[:id])
        if @address.update(address_params)
            redirect_to addresses_path
        else
            render:edit
        end
    end
    
    def destroy
        address = Address.find(params[:id])
        address.destroy
        redirect_to addresses_path
    end
    
    private
    
    def address_params
        params.require(:address).permit(:name, :address, :postal_code, :customer_id)
    end
    
    def correct_user
        @address = Address.find(params[:id])
        @customer = @address.customer
        redirect_to(addresses_path) unless @customer == current_customer
    end
end



