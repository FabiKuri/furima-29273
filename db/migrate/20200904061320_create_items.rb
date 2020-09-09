class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name                  , null: false
      t.text       :content               , null: false
      t.integer    :genre_id              , null: false
      t.integer    :itemdetail_id         , null: false
      t.integer    :shippingdetail_id     , null: false
      t.integer    :shippingprefecture_id , null: false
      t.integer    :shipping_day_id       , null: false
      t.integer    :price                 , null: false
      t.integer    :user_id               , null: false, foreign_key: ture
      t.boolean    :checked
      t.timestamps
    end
  end
end
