class Public::HomesController < ApplicationController
    def top
        @genres = Genre.all
        @items = Item.order("id DESC").limit(4)
        @customer = current_customer
    end
    
    def about
    end
end
