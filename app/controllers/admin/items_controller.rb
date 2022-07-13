class Admin::ItemsController < ApplicationController
    
    def new
        @item = Item.new
        @genres = Genre.all
    end
    
    def create
        @item = Item.new(item_params)
        @item.save
        redirect_to admin_item_path
    end
    
    def index
        @items = Item.all
    end
    
    def show
    end
    
    def edit
    end
    
    def update
    end
    
    private
    
    def item_params
        params.require(:item).permit(:name, :introduction, :price, :is_active, :genre_id)
    end
    
end
