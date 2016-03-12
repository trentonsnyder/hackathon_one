class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.integer :mileage
      t.string :name
      t.string :body
      t.date :date
      t.string :provider
      t.belongs_to :vehicle

      t.timestamps null: false
    end
  end
end
