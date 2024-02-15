class CitiesController < ApplicationController
  def index
    @cities = City.all
  end

  def show
    puts "%"*60
    puts @id
    puts "%"*60
    @city = City.find(params[:id])
    

  end
end
