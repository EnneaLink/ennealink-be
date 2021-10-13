class CreateEnneagrams < ActiveRecord::Migration[5.2]
  def change
    create_table :enneagrams do |t|
      t.integer :number
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
