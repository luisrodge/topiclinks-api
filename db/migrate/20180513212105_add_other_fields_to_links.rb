class AddOtherFieldsToLinks < ActiveRecord::Migration[5.1]
  def change
    add_column :links, :image, :text
    add_column :links, :link_title, :string
    add_column :links, :description, :text
  end
end
