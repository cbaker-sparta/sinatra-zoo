class ClassesController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')

  set :views, Proc.new { File.join(root, 'views') }

  configure :development do
    register Sinatra::Reloader

  end

  get "/classes" do
    @title = "Richmond Zoo"

    @classes = Class.all

    erb :'classes/index'
  end

  get "/classes/new" do
    @class = Class.new

    erb :'/classes/new'
  end

  post "/classes/" do

    new_class = Class.new

    new_class.class_id = params[:class_id]
    new_class.class = params[:class]
    new_class.class_description = params[:class_description]

    new_class.save

    redirect '/classes'
  end

  get "/classes/:id" do
    class_id = params[:id].to_i
    @class = Class.find(class_id)
    erb :'classes/show'
  end


  get "/classes/:id/edit" do
    class_id = params[:id].to_i
    @class = Class.find(class_id)
    erb :'classes/edit'
  end

  put "/classes/:id" do
    class_id = params[:id].to_i
    new_class = Class.find(class_id)

    new_class.class_id = params[:class_id]
    new_class.class = params[:class]
    new_class.class_description = params[:class_description]

    new_class.save

    redirect '/classes'
  end

  delete "/classes/:id" do
    class_id = params[:id].to_i
    Class.destroy(class_id)
    redirect '/classes'
  end

end
