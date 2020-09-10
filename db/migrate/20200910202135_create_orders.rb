class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer    :user_id               , null: false, foreign_key: ture
      t.integer    :item_id               , null: false, foreign_key: ture
      t.timestamps
    end
  end
end
