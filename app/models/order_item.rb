class OrderItem < ApplicationRecord
    
    belongs_to :order
    belongs_to :item
    
    validates :amount, presence: true
    validates :price, presence: true
    validates :making_status, presence: true
    validates :item_id, presence: true
    validates :order_id, presence: true
    
    enum making_status: { impossible: 0, wait: 1, production: 2, finish: 3 }
    
end
