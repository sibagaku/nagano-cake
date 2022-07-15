class Item < ApplicationRecord
    
    has_one_attached :image
    belongs_to :genre
    has_many :cart_items
    has_many :order_items
    
    validates :name, presence: true
    validates :introduction, presence: true
    validates :price, presence: true
    validates :is_active, presence: true
    validates :genre_id, presence: true
    validates :image, presence: true
    
    def get_image(width,height)
        image.variant(resize_to_limit:[width,height]).processed
    end
    
    def with_tax_price
        (price*1.1).floor
    end
end
