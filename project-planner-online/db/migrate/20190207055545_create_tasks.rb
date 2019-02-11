class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.text :description, length: { maximum: 7000 }
      t.datetime :due_date
      t.belongs_to :project, index: true, foreign_key: true, null: false
      t.belongs_to :user, index: true, foreign_key: true
      # the base of rails association is t.belongs_to :project, index: true

      t.timestamps null: false
    end
  end
end
