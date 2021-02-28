class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string     :title,               null: false
      t.text       :text,                null: false
      t.integer    :product_category_id, null: false
      t.integer    :product_status_id,   null: false
      t.integer    :burden_id,           null: false
      t.integer    :prefecture_id,       null: false
      t.integer    :days_id,             null: false
      t.string     :price,               null: false
      t.references :user,                null: false, foreign_key: true
      t.timestamps
    end
  end
end
