class CreatePeriodos < ActiveRecord::Migration[7.0]
  def change
    create_table :periodos do |t|
      t.string :fecha
      t.references :vigencia_ud, null: false, foreign_key: true

      t.timestamps
    end
  end
end
