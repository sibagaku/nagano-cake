class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      
      #商品名を保存するカラム
      t.string :name, null:false
      
      #商品説明文を保存するカラム
      t.text :introduction, null:false
      
      #税抜き価格を保存するカラム
      t.integer :price, null:false
      
      #販売ステータスを保存するカラム
      t.boolean :is_active, null:false, default:true
      
      #ジャンルID（外部キー）を保存するカラム
      t.integer :genre_id, null:false

      t.timestamps
    end
  end
end
