class AnimalsController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')

  set :views, Proc.new { File.join(root, 'views') }

  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    @title = "Richmond Zoo"

    @animals = Animal.all

    erb :'posts/animals/index'
  end

  # get "/animals/new" do
  #   @animal = Animal.new
  #
  #   erb :'posts/animals/new'
  # end
  #
  # post "/animals/" do
  #
  #   animal = Animal.new
  #
  #   animal.name = params[:name]
  #   animal.class = params[:class]
  #   animal.lifespan = params[:lifespan]
  #   animal.diet = params[:diet]
  #   animal.habitat = params[:habitat]
  #   animal.region = params[:region]
  #   animal.image = params[:image]
  #   animal.alt_tag = params[:alt_tag]
  #   animal.classId = params[:classId]
  #   animal.regionId = params[:regionId]
  #
  #   animal.save
  #
  #   redirect '/'
  # end
  #
  # get "/animals/:id" do
  #   animalId = params[:animalId].to_i
  #   @animal = Animal.find(animalId)
  #   erb :'posts/animals/show'
  # end
  #
  # get "/animals/:id/edit" do
  #   animalId = params[:animalId].to_i
  #   @animal = Animal.find(animalId)
  #   erb :'posts/animals/edit'
  # end
  #
  # put "/animals/:id" do
  #   animalId = params[:animalId].to_i
  #   animal = Animal.find(animalId)
  #
  #   animal.name = params[:name]
  #   animal.class = params[:class]
  #   animal.lifespan = params[:lifespan]
  #   animal.diet = params[:diet]
  #   animal.habitat = params[:habitat]
  #   animal.region = params[:region]
  #   animal.image = params[:image]
  #   animal.alt_tag = params[:alt_tag]
  #   animal.classId = params[:classId]
  #   animal.regionId = params[:regionId]
  #
  #   animal.save
  #
  #   redirect '/animals/'
  # end
  #
  # delete "/:id" do
  #   animalId = params[:animalId].to_i
  #   Animal.destroy(animalId)
  #   redirect '/animals/'
  # end

end
