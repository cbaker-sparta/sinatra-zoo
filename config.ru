require 'sinatra'
require 'sinatra/contrib'
require 'pg'
require_relative './models/animals'
require_relative './models/classes'
require_relative './models/regions'
require_relative './controllers/animals_controller'
require_relative './controllers/classes_controller'
require_relative './controllers/regions_controller'

use Rack::MethodOverride

run AnimalsController
use RegionsController
use ClassesController
