class AddNameToDealer < ActiveRecord::Migration[8.1]
  def change
    add_column :dealers, :name, :string
  end
end
