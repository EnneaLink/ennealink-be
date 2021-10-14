class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.references :myers_brigg, foreign_key: true
      t.references :enneagram, foreign_key: true

      t.timestamps
    end
  end
end
