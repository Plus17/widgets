class MakeWidgetAndManufacturers < ActiveRecord::Migration[7.0]
  def change
    create_table :widget_statuses, comment: "List of definitive widget statuses" do |t|
      t.text :name, null: false, comment: "The name of the status"
      t.timestamps null: false
    end

    add_index :widget_statuses, :name, unique: true, comment: "No two widget statuses should have the same name"

    create_table :addresses, comment: "Addresses for manufacturers" do |t|
      t.text :street, null: false, comment: "Street part of the address"
      t.text :zip, null: false, comment: "Postal or zip code of this address"
      t.timestamps null: false
    end
  end
end
