require 'sinatra'
require 'sinatra/contrib'
require 'sinatra/reloader' #if development?
require_relative './controllers/posts_controller'

use Rack::MethodOverride

run PostController
