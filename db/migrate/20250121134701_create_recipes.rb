class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :description
      t.string :image
      t.string :cooking_time
      t.text :ingredients
      t.text :instruction

      t.timestamps
    end
  end
end
