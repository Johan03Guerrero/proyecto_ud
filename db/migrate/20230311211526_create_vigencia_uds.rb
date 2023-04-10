class CreateVigenciaUds < ActiveRecord::Migration[7.0]
  def change
    create_table :vigencia_uds do |t|
      t.integer :anho_vigencia_ud
      t.json :archivo_vigencia_ud

      t.timestamps
    end
  end
end
