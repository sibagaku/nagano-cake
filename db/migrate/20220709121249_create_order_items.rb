class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      
      #注文商品の数量を保存するカラム
      t.integer :amount, null:false
      
      #購入時の価格を保存するカラム
      t.integer :price, null:false
      
      #制作ステータスを保存するカラム
      t.integer :making_status, null:false, default:0
      
      #商品ＩＤ（外部キー）を保存するカラム
      t.integer :item_id, null:false
      
      #注文ＩＤ（外部キー）を保存するカラム
      t.integer :order_id, null:false

      t.timestamps
    end
  end
end
