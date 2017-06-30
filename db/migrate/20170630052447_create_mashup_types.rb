class CreateMashupTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :mashup_types do |t|
      t.belongs_to :category, null: false, index: true
      t.text :name

      t.timestamps
    end

    add_foreign_key :mashup_types, :category, column: :category_id
  end
end
