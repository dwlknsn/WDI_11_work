class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.boolean :active
      t.decimal :credit_limit
      t.datetime :last_contact_at

      t.timestamps
    end
  end
end
