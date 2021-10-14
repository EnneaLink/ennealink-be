class CreateMyersBriggs < ActiveRecord::Migration[5.2]
  def change
    create_table :myers_briggs do |t|
      t.string :type
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
