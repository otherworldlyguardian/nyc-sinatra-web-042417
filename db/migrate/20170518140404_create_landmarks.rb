class CreateLandmarks < ActiveRecord::Migration
  def change
    create_table :landmarks do |t|
      t.string :name
      t.references :figure
      t.string :year_completed
    end
  end
end
