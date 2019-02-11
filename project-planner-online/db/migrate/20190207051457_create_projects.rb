class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.text :description, length: { maximum: 7000 }
      t.timestamps null: false
    end
  end
end
