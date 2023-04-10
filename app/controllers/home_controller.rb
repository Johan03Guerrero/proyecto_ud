# frozen_string_literal: true

class HomeController < ApplicationController
  include I18n::Locale
  layout 'application'

  def index
    params[:partial] ||= 'principal'
    @locale = :es
  end
end
