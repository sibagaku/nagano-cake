class Admin::ItemsController < ApplicationController
    
    def new
        @item = Item.new
    end
    
    def create
        @item = Item.new(item_params)
        @item.save
        redirect_to admin_item_path
    end
    
    def index
    end
    
    def show
    end
    
    def edit
    end
    
    def update
    end
    
    private
    
    def item_params
        
    end
    
end