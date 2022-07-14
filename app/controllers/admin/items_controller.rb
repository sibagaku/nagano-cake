class Admin::ItemsController < ApplicationController
    
    
    def new
        @item = Item.new
        @genres = Genre.all
    end
    
    def create
        @item = Item.new(item_params)
        if @item.save
            redirect_to admin_item_path(@item.id)
        else
            @genres = Genre.all
            render :new
        end
    end
    
    def index
        @items = Item.all
    end
    
    def show
        @item = Item.find(params[:id])
    end
    
    def edit
    end
    
    def update
    end
    
    private
    
    def item_params
        params.require(:item).permit(:name, :introduction, :price, :is_active, :genre_id, :image)
    end
    
end
