class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :make, null: false
      t.string :model, null: false
      t.integer :year, null: false
      t.belongs_to :user
      t.string :avatar

      t.timestamps null: false
    end
  end
end
