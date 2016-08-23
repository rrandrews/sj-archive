class AddCategoryToColumns < ActiveRecord::Migration[5.0]
  def change
    add_reference :columns, :category, foreign_key: true
  end
end
