class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      
      
      #宛名を保存するカラム
      t.string :name, null:false
      
      #郵便番号を保存するカラム
      t.string :postal_code, null:false
      
      #住所を保存するカラム
      t.string :address, null:false
      
      #会員ID（外部キー）を保存するカラム
      t.integer :customer_id, null:false

      t.timestamps
    end
  end
end
