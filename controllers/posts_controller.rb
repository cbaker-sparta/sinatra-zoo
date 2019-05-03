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
      image: "https://www.wwf.org.uk/sites/default/files/styles/social_share_image/public/2016-09/Medium_WW22557.jpg?itok=hg7S3zWD",
      alt_tag: "Picture of a Gorilla"
    },
    {
      id: 1,
      name: "Vampire Bat",
      species: "Chiroptera",
      lifespan: "9-10 years",
      diet: "Carnivore",
      habitat: "Caves",
      image: "https://thumbs-prod.si-cdn.com/Rg0MNNgbSS5IdHvXFDZb9j9-mmo=/800x600/filters:no_upscale():focal(815x330:816x331)/https://public-media.si-cdn.com/filer/c4/5e/c45e215d-7646-4a2d-9586-611fa177e8c7/desmo-boden.jpg",
      alt_tag: "Picture of a Vampire Bat"
    },
    {
      id: 2,
      name: "Anaconda",
      species: "Serpentes",
      lifespan: "10-12 years",
      diet: "Carnivore",
      habitat: "Tropical",
      image: "https://media-cdn.tripadvisor.com/media/photo-s/0d/fc/47/63/anaconda.jpg",
      alt_tag: "Picture of an Anaconda"
    },
    {
      id: 3,
      name: "Spider-pig",
      species: "Spiderus-Pigi",
      lifespan: "Infinity - we are all spider-pigs",
      diet: "The souls of the fallen",
      habitat: "Our hearts and minds",
      image: "https://i.kym-cdn.com/photos/images/newsfeed/000/377/300/e30",
      alt_tag: "Picture of the Spider-Pig"
    },
    {
      id: 4,
      name: "Koala",
      species: "Marsupial",
      lifespan: "13-18 years",
      diet: "Herbivore",
      habitat: "Forest", 
      image: "https://img.purch.com/w/660/aHR0cDovL3d3dy5saXZlc2NpZW5jZS5jb20vaW1hZ2VzL2kvMDAwLzA5OS83MTYvb3JpZ2luYWwva29hbGFzLXdpdGgtY2hsYW15ZGlhLmpwZw==",
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
