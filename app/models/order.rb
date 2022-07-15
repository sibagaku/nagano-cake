class Order < ApplicationRecord
    
    belongs_to :customer
    has_many :order_items
    
    validates :delivery_address, presence: true
    validates :delivery_name, presence: true
    validates :delivery_postal_code, presence: true
    validates :payment, presence: true
    validates :status, presence: true
    validates :postage, presence: true
    validates :payment_method, presence: true
    validates :customer_id, presence: true
    
    
    enum status:{
        入金待ち: 0,
        入金確認: 1,
        制作中: 2,
        発送準備中: 3,
        発送済み: 4,
    }
    
    enum payment_method:{
        credit: 1, #クレジットカード
        bank: 2, #銀行振込
    }
    
end
