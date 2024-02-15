class CitiesController < ApplicationController
  def index
    @cities = City.all
  end

  def show
    puts "%"*60
    puts @id
    puts "%"*60
    @gossip = Gossip.find(params[:id])
    @city = @gossip.user.city  

  end
end
