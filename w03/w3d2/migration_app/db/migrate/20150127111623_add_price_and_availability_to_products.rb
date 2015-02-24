class AddPriceAndAvailabilityToProducts < ActiveRecord::Migration
  def change
    add_column :products, :price, :decimal
    add_column :products, :availability, :boolean
  end
end
