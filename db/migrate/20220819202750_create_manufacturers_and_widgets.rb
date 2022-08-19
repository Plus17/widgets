class CreateManufacturersAndWidgets < ActiveRecord::Migration[7.0]
  def change
    create_table :manufacturers, comment: "Makers of the widgets we sell" do |t|
      t.text :name, null: false, comment: "Name of this manufacturer"
      t.references :address, null: false, index: true, foreign_key: true, comment: "The address of this manufacturer"
      t.timestamps null: false
    end

    add_index :manufacturers, :name, unique: true

    create_table :widgets, comment: "The stuff we sell" do |t|
      t.text :name, null: false, comment: "Name of this widget"
      t.integer :price_cents, null: false, comment: "Price of this widget in cents"
      t.references :widget_status, null: false, index: true, foreign_key: true, comment: "The current status of this widget"
      t.references :manufacturer, null: false, index: true, foreign_key: true, comment: "The maker of this widget"
      t.timestamps null: false
    end

    add_index :widgets, [:name, :manufacturer_id], unique: true, comment: "No manufacturer can have two widgets with the same name"

    add_check_constraint(:widgets, "price_cents > 0", name: "price_must_be_positive")
  end
end
