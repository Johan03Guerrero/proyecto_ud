class CreateConceptos < ActiveRecord::Migration[7.0]
  def change
    create_table :conceptos do |t|
      t.string :codigo
      t.string :nombre

      t.timestamps
    end
  end
end
