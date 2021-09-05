class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :plan, null: false, foreign_key: true

      t.text :content
      t.string :image

      t.timestamps
      t.index %i[user_id plan_id]
    end
  end
end
