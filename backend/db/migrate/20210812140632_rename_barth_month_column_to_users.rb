class RenameBarthMonthColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :barth_year, :birth_year
    rename_column :users, :barth_month, :birth_month
    rename_column :users, :barth_day, :birth_day
  end
end
