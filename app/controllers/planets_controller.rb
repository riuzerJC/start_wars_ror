class PlanetsController < ApplicationController

  before_action :set_planet, only: [:show, :edit, :update, :destroy]

  def index
    planets = Planet.all

    render json: planets
  end

  def show
    render json: @planet
  end

  def create
    planet = Planet.new(planet_params)

    if planet.save
      render json: planet, status: :created
    else
      render json: planet.errors, status: :unprocessable_entity
    end
  end

  def update
    if @planet.update(planet_params)
      render json: @planet
    else
      render json: @planet.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @planet.destroy
    head :no_content
  end

  private

  def set_planet
    @planet = Planet.find(params[:id])
  end

  def planet_params
    params
      .require(:planet)
      .permit(
        :name,
        :rotation_period,
        :orbital_period,
        :diameter,
        :climate,
        :gravity,
        :terrain,
        :surface_water,
        :population
      )
  end
end
