# frozen_string_literal: true

class VigenciaUdsController < ApplicationController
  def create
    @vigencia_ud = VigenciaUd.new(vigencia_ud_params)
    if @vigencia_ud.save
      redirect_to root_path(partial: 'form'), notice: 'Vigencia creada exitosamente'
    else
      redirect_to root_path(partial: 'form'), alert: 'Error al crear la vigencia'
    end
  end

  private

  def vigencia_ud_params
    params.require(:vigencia_ud).permit(:anho_vigencia_ud)
  end
end
