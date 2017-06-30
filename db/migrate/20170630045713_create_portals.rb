class CreatePortals < ActiveRecord::Migration[5.1]
  def change
    create_table :portals do |t|
      t.text :name,                          null: false
      t.text :description,                   null: false
      t.text :search_base_url,               null: false
      t.text :dataset_base_url,              null: false
      t.text :dataset_element_selector,      null: false
      t.text :dataset_relative_url_selector, null: false
      t.text :dataset_name_selector,         null: false
      t.text :dataset_description_selector,  null: false

      t.timestamps
    end
  end
end
