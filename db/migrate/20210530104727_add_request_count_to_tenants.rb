class AddRequestCountToTenants < ActiveRecord::Migration[6.0]
  def change
    add_column :tenants, :request_count, :integer
  end
end
