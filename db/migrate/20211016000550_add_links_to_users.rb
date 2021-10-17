class AddLinksToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :myers_briggs, :link, :string
    add_column :enneagrams, :link, :string
  end
end
