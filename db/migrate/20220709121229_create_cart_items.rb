class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      
       #商品の数量を保存するカラム
      t.integer :amount, null:false
      
      #商品ID（外部キー）を保存するカラム
      t.integer :item_id, null:false
      
      #会員ID（外部キー）を保存するカラム
      t.integer :customer_id, null:false

      t.timestamps
    end
  end
end
