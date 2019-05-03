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
      habitat: "Forest/Jungle",
      image: "./images/gorilla.jpg",
      alt_tag: "Picture of a Gorilla"
    },
    {
      id: 1,
      name: "Vampire Bat",
      species: "Chiroptera",
      lifespan: "9-10 years",
      diet: "Carnivore",
      habitat: "Caves",
      image: "./images/vampire_bat.jpg",
      alt_tag: "Picture of a Vampire Bat"
    },
    {
      id: 2,
      name: "Anaconda",
      species: "Serpentes",
      lifespan: "10-12 years",
      diet: "Carnivore",
      habitat: "Tropical",
      image: "./images/anaconda.jpg",
      alt_tag: "Picture of an Anaconda"
    },
    {
      id: 3,
      name: "Spider-pig",
      species: "Spiderus-Pigi",
      lifespan: "Infinity - we are all spider-pigs",
      diet: "The souls of the fallen",
      habitat: "Our hearts and minds",
      image: "./images/spiderpig.jpeg",
      alt_tag: "Picture of the Spider-Pig"
    },
    {
      id: 4,
      name: "Koala",
      species: "Marsupial",
      lifespan: "13-18 years",
      diet: "Herbivore",
      habitat: "Forest",
      image: "./images/koala.jpg",
      alt_tag: "Picture of a Koala"
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
