require 'sinatra'
require 'sinatra/contrib'
require 'pg'
require_relative './controllers/animals_controller'

use Rack::MethodOverride

run AnimalsController
