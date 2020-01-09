class AddPricingToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :pricing, :string
  end
end
