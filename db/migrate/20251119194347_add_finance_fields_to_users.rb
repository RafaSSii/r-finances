class AddFinanceFieldsToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :renda, :decimal
    add_column :users, :gastos, :decimal
    add_column :users, :meta, :decimal
  end
end
