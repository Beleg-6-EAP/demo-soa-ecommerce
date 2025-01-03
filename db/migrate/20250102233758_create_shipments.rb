class CreateShipments < ActiveRecord::Migration[7.0]
  def change
    create_table :shipments do |t|
      t.string :order_id
      t.string :tracking_id

      t.timestamps
    end
  end
end
