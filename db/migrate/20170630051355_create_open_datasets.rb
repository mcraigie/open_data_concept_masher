class CreateOpenDatasets < ActiveRecord::Migration[5.1]
  def change
    create_table :open_datasets do |t|
      t.belongs_to :portal,      null: false, index: true
      t.belongs_to :category,    null: false, index: true
      t.text       :name,        null: false
      t.text       :description, null: false
      t.text       :url,         null: false

      t.timestamps
    end

    add_foreign_key :open_datasets, :portal,   column: :portal_id
    add_foreign_key :open_datasets, :category, column: :category_id
  end
end
