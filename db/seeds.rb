# frozen_string_literal: true

# bundle exec rake db:drop DISABLE_DATABASE_ENVIRONMENT_CHECK=1
# bundle exec rake db:create && bundle exec rake db:migrate
# bundle exec rake db:seed

User.create(email: 'testuserud@testcorreo.com', password: 'uDistrital123!')
VigenciaUd.create(anho_vigencia_ud: 2021, archivo_vigencia_ud: [])

xlsx_importer = XlsxImporterService.new('db/datos_iniciales/meses_faltantes_1_2021.xlsx')
xlsx_importer.call
