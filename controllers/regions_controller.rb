class RegionsController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')

  set :views, Proc.new { File.join(root, 'views') }

  configure :development do
    register Sinatra::Reloader

  end

  get "/regions" do
    @title = "Richmond Zoo"

    @regions = Region.all

    erb :'regions/index'
  end

  get "/regions/new" do
    @region = Region.new

    erb :'/regions/new'
  end

  post "/regions/" do

    region = Region.new

    region.region_id = params[:region_id]
    region.region = params[:region]
    region.continent = params[:continent]
    region.map_image = params[:map_image]
    region.map_alt = params[:map_alt]

    region.save

    redirect '/regions'
  end

  get "/regions/:id" do
    region_id = params[:id].to_i
    @region = Region.find(region_id)
    erb :'regions/show'
  end


  get "/regions/:id/edit" do
    region_id = params[:id].to_i
    @region = Region.find(region_id)
    erb :'regions/edit'
  end

  put "/regions/:id" do
    region_id = params[:id].to_i
    region = Region.find(region_id)

    region.region_id = params[:region_id]
    region.region = params[:region]
    region.continent = params[:continent]
    region.map_image = params[:map_image]
    region.map_alt = params[:map_alt]

    region.save

    redirect '/regions'
  end

  delete "/regions/:id" do
    region = params[:id].to_i
    Region.destroy(region_id)
    redirect '/regions'
  end

end
