class CreatePresupuestoConceptos < ActiveRecord::Migration[7.0]
  def change
    create_table :presupuesto_conceptos do |t|
      t.float :presupuesto_inicial
      t.float :adicion_modificacion_mes
      t.float :adicion_modificacion_acumulado
      t.float :presupuesto_definitivo
      t.float :recaudo_mes
      t.float :recaudo_acumulado
      t.float :ejecucion
      t.float :saldo_por_recaudar
      t.references :concepto, null: false, foreign_key: true
      t.references :periodo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
