require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

configure :development do
  use Rack::MethodOverride # Habilitar los metodos delete y patch
end

get "/" do
erb :home
end

get "/restaurants" do
 @restaurants = Restaurant.all # toda la informacon del restaurante
 erb :index # vista de la pagina
end

# para crear un restaurante
get "/restaurants/new" do

  erb :new
end

post "/restaurants" do #  boton guardar los datos nuevos
Restaurant.create(name: params[:name],
  city: params[:city],
  image_url: params[:image_url],
  phone_number: params[:phone_number],
  address: params[:address],
  type_food: params[:type_food])

  redirect to "/restaurants"
end

# guardar ruta
get "/restaurants/:id" do  # show
  @restaurant = Restaurant.find(params[:id])
  erb :show
end

# editar
get "/restaurants/:id/edit" do # modificamos los datos

end

patch "/restaurants/:id" do # permite guardar los datos modificados Boton guardar datos modificados

end

delete "/restaurants/:id" do

end
