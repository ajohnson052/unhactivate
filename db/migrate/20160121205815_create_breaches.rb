class CreateBreaches < ActiveRecord::Migration
  def change
    create_table :breaches do |t|
      t.string :title
      t.date :breach_date
      t.text :description

      t.timestamps null: false
    end
  end
end
