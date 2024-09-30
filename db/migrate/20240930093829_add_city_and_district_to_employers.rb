class AddCityAndDistrictToEmployers < ActiveRecord::Migration[7.1]
  def change
    add_column :employers, :city, :string
    add_column :employers, :district, :string
  end
end
