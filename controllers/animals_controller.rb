class AnimalsController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')

  set :views, Proc.new { File.join(root, 'views') }

  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    @title = "Richmond Zoo"
    @animals = $animals
    erb :'posts/index'
  end

  get "/new" do
    @animal = {
      id: "",
      name: "",
      species: "",
      lifespan: "",
      diet: "",
      habitat: "",
      image: "",
      alt_tag: ""
    }
    erb :'posts/new'
  end

  post "/" do

    new_animal = {
      id: $animals.length,
      name: params[:name],
      species: params[:species],
      lifespan: params[:lifespan],
      diet: params[:diet],
      habitat: params[:habitat],
      image: params[:image],
      alt_tag: params[:alt_tag]
    }
     $animals.push(new_animal)
     redirect '/'
  end

  get "/:id" do
    id = params[:id].to_i
    @animal = $animals[id]
    erb :'posts/show'
  end

  get "/:id/edit" do
    id = params[:id].to_i
    @animal = $animals[id]
    erb :'posts/edit'
  end

  put "/:id" do
    id = params[:id].to_i
    animal = $animals[id]
    animal[:name] = params[:name]
    animal[:species] = params[:species]
    animal[:lifespan] = params[:lifespan]
    animal[:diet] = params[:diet]
    animal[:habitat] = params[:habitat]
    animal[:image] = params[:image]
    animal[:alt_tag] = params[:alt_tag]
    $animals[id] = animal

    redirect '/'
  end

  delete "/:id" do
    id = params[id].to_i
    $animals.delete_at(id)
    redirect '/'
  end

end
