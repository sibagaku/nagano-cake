class OrderItem < ApplicationRecord
    
    belongs_to :order
    belongs_to :item
    
    validates :amount, presence: true
    validates :price, presence: true
    validates :making_status, presence: true
    validates :item_id, presence: true
    validates :order_id, presence: true
    
    enum making_status:{
        着手不可: 0,
        制作待ち: 1,
        制作中: 2,
        制作完了: 3,
    }
    
end
