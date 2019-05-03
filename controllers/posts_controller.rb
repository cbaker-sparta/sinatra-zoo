class PostController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')

  set :views, Proc.new { File.join(root, 'views') }

  configure :development do
    register Sinatra::Reloader
  end

  $animals = [{
      id: 0,
      name: "Gorilla",
      species: "Primate",
      lifespan: "35-40 years",
      diet: "Herbivore",
      habitat: "Forest/Jungle"
    },
    {
      id: 1,
      name: "Vampire Bat",
      species: "Chiroptera",
      lifespan: "9-10 years",
      diet: "Carnivore",
      habitat: "Caves"
    },
    {
      id: 2,
      name: "Anaconda",
      species: "Serpentes",
      lifespan: "10-12 years",
      diet: "Carnivore",
      habitat: "Tropical"
    },
    {
      id: 3,
      name: "Spider-pig",
      species: "Spiderus-Pigi",
      lifespan: "Infinity - we are all spider-pigs",
      diet: "The souls of the fallen",
      habitat: "Our hearts and minds"
    },
    {
      id: 4,
      name: "Koala",
      species: "Marsupial",
      lifespan: "13-18 years",
      diet: "Herbivore",
      habitat: "Forest"
    }]

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
      habitat: ""
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
      habitat: params[:habitat]
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
    $animals[id] = animal

    redirect '/'
  end

  delete "/:id" do
    id = params[id].to_i
    $animals.delete_at(id)
    redirect '/'
  end

end
