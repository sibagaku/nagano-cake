class Public::CustomersController < ApplicationController
    def show
        @customer = current_customer
    end
    
    def edit
        @customer = current_customer
    end
    
    def update
        @customer = current_customer
        @customer.update(customer_params)
        redirect_to mypage_path
    end
    
    def unsubscribe
        @customer = current_customer
    end
    
    def withdrawal
        @customer = current_customer
        @customer.update(is_deleted: true)  #退会ステータスをfalse（退会）に変更
        reset_session #情報の削除
        redirect_to root_path
    end
    
    private
    
    def customer_params
        params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
    end
end
