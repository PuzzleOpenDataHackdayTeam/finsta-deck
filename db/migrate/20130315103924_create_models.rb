class CreateModels < ActiveRecord::Migration
  def change
    create_table :munis do |t|
      t.string  :name
      t.string  :map
      t.integer :people
      t.integer :agglo
    end

    create_table :types do |t|
      t.string :name
      t.string :unit
      t.text :text
    end

    create_table :numbers do |t|
      t.integer :muni_id
      t.integer :type_id
      t.integer :year
      t.decimal :value
    end

    add_index(:numbers, [:muni_id, :type_id])
  end
end
