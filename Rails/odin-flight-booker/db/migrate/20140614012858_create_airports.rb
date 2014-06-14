class CreateAirports < ActiveRecord::Migration
  def change
    create_table :airports do |t|
      t.string :codename

      t.timestamps
    end
  end
end
