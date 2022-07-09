class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      
      #配送先氏名を保存するカラム
      t.string :delivery_name, null:false
      
      #配送先住所を保存するカラム
      t.string :delivery_address, null:false
      
      #配送先郵便番号を保存するカラム
      t.string :delivery_postal_code, null:false
      
      #支払金額を保存するカラム
      t.integer :payment, null:false
      
      #注文ステータスを保存するカラム
      t.integer :status, null:false, default:0
      
      #送料を保存するカラム
      t.integer :postage, null:false
      
      #支払方法を保存するカラム
      t.integer :payment_method, null:false, default:0
      
      #会員ID（外部キー）を保存するカラム
      t.integer :customer_id, null:false

      t.timestamps
    end
  end
end
