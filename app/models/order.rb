class Order < ApplicationRecord
    
    belongs_to :customer
    has_many :order_items, dependent: :destroy
    
    validates :delivery_address, presence: true
    validates :delivery_name, presence: true
    validates :delivery_postal_code, presence: true
    validates :payment, presence: true
    validates :status, presence: true
    validates :postage, presence: true
    validates :payment_method, presence: true
    validates :customer_id, presence: true
    
    
    enum payment_method: { credit_card: 0, transfer: 1 }
    
    enum status: { wait: 0, confirmation: 1, production: 2,  preparation: 3, sent: 4 }
    
end
