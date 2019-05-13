require_relative '../models/animals'

class AnimalsController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')

  set :views, Proc.new { File.join(root, 'views') }

  configure :development do
    register Sinatra::Reloader
  end

  get "/animals" do
    @title = "Richmond Zoo"

    @animals = Animal.all

    erb :'/animals/index'
  end

  get "/animals/new" do
    @animal = Animal.new
    @regions = Region.new
    @classes = Class.new

    erb :'/animals/new'
  end

  post "/animals/" do

    animal = Animal.new

    animal.name = params[:name]
    animal.lifespan = params[:lifespan]
    animal.diet = params[:diet]
    animal.habitat = params[:habitat]
    animal.image = params[:image]
    animal.alt_tag = params[:alt_tag]
    animal.class_id = params[:class_id]
    animal.region_id = params[:region_id]

    animal.save

    redirect '/animals'
  end

  get "/animals/:id" do
    animal_id = params[:id].to_i
    @animal = Animal.find(animal_id)
    erb :'/animals/show'
  end

  get "/animals/:id/edit" do
    animal_id = params[:id].to_i
    @animal = Animal.find(animal_id)
    @regions = Region.all
    @classes = Class.all
    erb :'/animals/edit'
  end

  put "/animals/:id" do
    animal_id = params[:id].to_i

    animal = Animal.find(animal_id)

    animal.name = params[:name]
    animal.class = params[:class]
    animal.lifespan = params[:lifespan]
    animal.diet = params[:diet]
    animal.habitat = params[:habitat]
    animal.region = params[:region]
    animal.image = params[:image]
    animal.alt_tag = params[:alt_tag]
    animal.class_id = params[:class_id]
    animal.region_id = params[:region_id]

    animal.save

    redirect '/animals'
  end

  delete "/animals/:id" do
    animal_id = params[:id].to_i
    Animal.destroy(animal_id)
    redirect '/animals'
  end

end
