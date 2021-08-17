class CreateJoins < ActiveRecord::Migration[6.0]
  def change
    create_table :joins do |t|
      t.references :user, null: false, foreign_key: true
      t.references :plan, null: false, foreign_key: 

      t.timestamps

      t.index %i[user_id plan_id], unique: true
    end
  end
end
