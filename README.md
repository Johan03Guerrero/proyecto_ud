<a name="readme-top"></a>
<br />
<div align="center">
    
  <h2 align="center">MODELO PARA EL ANÁLISIS DE DATOS Y ESTIMACIÓN DE COSTOS EN EL
  PRESUPUESTO DE LA UNIVERSIDAD DISTRITAL FRANCISCO JOSÉ DE
  CALDAS</h2>

  <img src="https://user-images.githubusercontent.com/40550092/231629292-f9e3bc1c-6908-41c6-a7d6-58a9903b7117.jpg"
   alt="Logo" width="280" height="280">

</div>

<details>
  <summary>Tabla de Contenido</summary>
  <ol>
    <li>
      <a href="#descripción-del-proyecto">Descripción del proyecto</a>
      <ul>
        <li><a href="#desarrollado-con">Desarrollado con</a></li>
      </ul>
    </li>
    <li>
      <a href="#instrucciones-de-instalación">Instrucciones de Instalación</a>
      <ul>
        <li><a href="#pre-requisitos">Pre-Requisitos</a></li>
        <li><a href="#instalación">Instalación</a></li>
      </ul>
    </li>
    <li><a href="#uso">Uso</a></li>
    <li><a href="#documentación">Documentación</a></li>
    <li><a href="#licencia">Licencia</a></li>
    <li><a href="#contacto">Contacto</a></li>
  </ol>
</details>



## Descripción del proyecto

Aplicación web diseñada para realizar las estimaciones y análisis de los costos de la Universidad Distrital Francisco José de Caldas, donde se podrán cargar los archivos de los presupuestos mensuales y visualizar diferentes graficas para la interpretación de la información. La construcción de este sistema es a partir del análisis de datos que es la manera más adecuada para tratar grandes volúmenes de archivos convirtiéndolos en información útil para la generación de informes y reportes adaptándose a las necesidades de la persona o entidad que lo requiera de una manera fácil y rápida. 



### Desarrollado con:

* [![RubyOnRails][RubyOnRails.com]][RubyOnRails-url]
* [![JavaScript][JavaScript.com]][JavaScript-url]
* [![Postgresql][Postgresql.com]][Postgresql-url]
* [![Bootstrap][Bootstrap.com]][Bootstrap-url]

<p align="right">(<a href="#readme-top">Volver al Inicio</a>)</p>



## Instrucciones de Instalación
### Pre-Requisitos

* Ruby 2.7.4
* Node 16.16.0
* Npm 8.11.0
* PostgreSql 15.1

### Instalación

1. Clonar el repositorio
   ```sh
   git clone https://github.com/Johan03Guerrero/proyecto_ud.git
   ```
2. Instalar paquetes NPM
   ```sh
   npm install
   ```
3. Intalar gemas
   ```sh
   bundle install
   ```
4. Crear la base de datos y realizar migraciones
   ```sh
   bundle exec rake db:create && bundle exec rake db:migrate
   ```
5. Inicializar el aplicativo local
   ```sh
   rails s
   ```

<p align="right">(<a href="#readme-top">Volver al Inicio</a>)</p>



## Uso

Para hacer uso de la aplicación se debe tener un usuario registrado previamente en la aplicación.
Para crear un usuario se deben seguir los siguientes pasos: 

1. Ingresar a la consola de ruby
   ```sh
   rails c
   ```
2. Realizar el registro de la siguiente manera:
   ```rb
   User.create(email: '<correo>', password: '<contraseña>')
   ```
Una vez realizado el registro del usuario, inicializar el servidor local. 

1. Ingresar al siguiente link http://localhost:3000/

<img src="https://user-images.githubusercontent.com/40550092/232258052-b7a00a42-5a35-4240-b6e3-83ceeb5ca793.png"
   alt="Inicial" width="980" height="540">

2. Hacer click en iniciar sesión:

<img src="https://user-images.githubusercontent.com/40550092/232258196-e8226f17-9e84-436b-be33-289b48a1e787.png"
   alt="inicial" width="980" height="440">

3. Una vez iniciada sesión, se encontrara con el siguiente menú:

<img src="https://user-images.githubusercontent.com/40550092/232258279-8a2dfa49-47ca-483b-84ab-2513adce51c3.png"
   alt="iniciar_sesion" width="980" height="140">

  * Opción App UD Presupuestos: Esta opción lleva al inicio de la aplicación, en esta sección estará la tabla general con la información de todos los archivos cargados en el aplicativo. Esta sección cuenta con unos filtros por fecha. Así como la posibilidad de descargar la información en csv, pdf, excel o copiar la información. 

<img src="https://user-images.githubusercontent.com/40550092/232259157-88c1b349-4999-4a1a-b85b-352ed3308ed5.png"
   alt="home" width="980" height="440">

 * Opción Dashboard: En esta sección se encuentran las graficas correspondientes a los diferentes informes que se soliciten, tendrá diferentes tipos de filtros para generar los diferentes tipos de gráficos requeridos.

<img src="https://user-images.githubusercontent.com/40550092/232259691-64e35439-71d2-4b56-939e-5bd2a7c73dc9.png"
   alt="dashboard" width="980" height="440">
   
 * Opción Cargar Documentos: En esta sección se encuentran los dos tipos de formularios para crear vigencias y cargar los .xlsx de los presupuestos.

<img src="https://user-images.githubusercontent.com/40550092/232259839-8ff86862-ccfa-4f84-b9f4-3a47ea9a23c3.png"
   alt="crear_vigencia" width="980" height="180">

<img src="https://user-images.githubusercontent.com/40550092/232259855-6aa5e907-8adf-4875-91ed-0a78e92afae3.png"
   alt="cargar_documentos" width="980" height="440">

* Opción Cerrar Sesión: Al hacer click en este botón se cerrara sesión.

<img src="https://user-images.githubusercontent.com/40550092/232259962-7cf71a82-b90e-4f7b-8cd3-d35fdc5a19c1.png"
   alt="cerrar" width="240" height="140">

<p align="right">(<a href="#readme-top">Volver al Inicio</a>)</p>


## Documentación

Para la realización del proyecto se siguio la guia de configuración de ruby on rails: https://guides.rubyonrails.org/getting_started.html. 
Se genero la siguiente estructura de base de datos para dar solución a la problematica:
![image](https://user-images.githubusercontent.com/40550092/232260408-fec72aa0-d99c-48b0-a56b-44a0c4bc6e13.png)

1. Gemas utilizadas en el proyecto: 
```rb
source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.4'

gem 'bootsnap', require: false
gem 'devise'
gem 'gon'
gem 'importmap-rails'
gem 'jbuilder'
gem 'pg'
gem 'puma', '~> 5.6'
gem 'rails', '~> 7.0.4'
gem 'rails-i18n'
gem 'redis', '~> 4.0'
gem 'roo-xls'
gem 'rubocop'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'letter_opener'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'rubocop-airbnb'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
```

* Para la implementación del manejo de usuarios (Usuarios), se hizo uso de la gema devise: https://github.com/heartcombo/devise
* Para la carga y lectura de archivos xlsx, se hizo uso de la gema roo-xls: https://github.com/roo-rb/roo-xls
* Para el análisis y formateo de código, se hizo uso de la gema rubocop: https://github.com/rubocop/rubocop 
* Para el manejo de archivos JavaScript en RoR, se hizo uso de la gema stimulus-rails: https://github.com/hotwired/stimulus-rails

2. Librerias utilizadas en el proyecto: 
```js
{
  "dependencies": {
    "@hotwired/stimulus": "^3.2.1",
    "@hotwired/stimulus-webpack-helpers": "^1.0.1",
    "@hotwired/turbo": "^7.2.4",
    "@rails/webpacker": "^5.4.3",
    "apexcharts": "^3.37.3",
    "bootstrap": "^5.3.0-alpha1",
    "datatables.net-buttons-dt": "^2.3.6",
    "datatables.net-dt": "^1.13.4",
    "dropzone": "^6.0.0-beta.2",
    "select2": "^4.1.0-rc.0"
  }
}
```
* Para la plantilla de estilos, se hizo uso de bootstrap: https://getbootstrap.com/
* Para el manejo de los selects, se hizo uso de select2: https://select2.org/
* Para el manejo de las graficas, se hizo uso de apexcharts: https://apexcharts.com/


<p align="right">(<a href="#readme-top">Volver al Inicio</a>)</p>


## Licencia

<p align="right">(<a href="#readme-top">Volver al Inicio</a>)</p>


## Contacto


<p align="right">(<a href="#readme-top">Volver al Inicio</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[Bootstrap.com]: https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white
[Bootstrap-url]: https://getbootstrap.com
[RubyOnRails.com]: https://img.shields.io/badge/Ruby_On_Rails-D30001?style=for-the-badge&logo=ruby&logoColor=white
[RubyOnRails-url]: https://rubyonrails.org/
[JavaScript.com]: https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black
[JavaScript-url]: https://www.javascript.com/
[Postgresql.com]: https://img.shields.io/badge/PostgreSql-31638B?style=for-the-badge&logo=postgresql&logoColor=white
[Postgresql-url]: https://www.postgresql.org/



