class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string      :dish_name, null: false
      t.text        :ingredient, null: false
      t.text        :make, null: false
      t.text        :introduction, null: false
      t.references  :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
