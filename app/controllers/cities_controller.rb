class CitiesController < ApplicationController
  def index
    @cities = City.all
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    if @city.save
      redirect_to cities_path
    else
      render "new"
    end
  end

  def show
    find_city
    if @city.nil?
      flash[:error] = "Houston we have a problem! Try Later!"
      redirect_to root_path
    end
  end

  def edit
    find_city
  end

  def update
    find_city
    if @city.update(city_params)
      redirect_to cities_path
      flash[:success] = "City UPDATED Successfully!"
    else
      flash[:error] = "Houston we have a problem! Try Later!"
      render "edit"
    end
  end

  def destroy
    find_city
    if @city.destroy
      flash[:success] = "City Delete Successfully!"
    else
      flash[:error] = "Houston we have a problem! Try Later!"
    end
    ##binding.pry
    redirect_to cities_path
  end

  private

  def find_city
    @city = City.find_by(id: params[:id])
  end
  #strong parameters
  def city_params
      params.require(:city).permit(:name, :country_name, :time_zone)
  end
end
