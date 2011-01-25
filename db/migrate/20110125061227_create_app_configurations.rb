class CreateAppConfigurations < ActiveRecord::Migration
  def self.up
    create_table :app_configurations do |t|
      t.integer :site_availability, :default => 100 # Fully operational
    end
  end

  def self.down
drop_table :app_configurations
  end
end
