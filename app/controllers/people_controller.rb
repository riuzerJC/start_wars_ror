class PeopleController < ApplicationController

  before_action :set_film, only: [:show, :edit, :update, :destroy]

  def index
    people = People.all

    render json: people
  end

  def show
    render json: @people
  end

  def create
    people = Film.new(people_params)

    if people.save
      render json: people, status: :created
    else
      render json: people.errors, status: :unprocessable_entity
    end
  end

  def update
    people = PlanetService.new.get_planets_from_ids(film_params[:planets])

    data = film_params.dup
    data[:planets] = planets

    if @film.update(data)
      render json: @film, include: :planets
    else
      render json: @film.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @film.destroy
    head :no_content
  end

  private

  def set_film
    @film = Film.find_by(id: params[:id])

    unless @film
      render json: { error: "Film not found" }, status: :not_found
    end
  end

  def film_params
    params
      .require(:film)
      .permit(
        :title,
        :episode_id,
        :opening_crawl,
        :director,
        :producer,
        :release_date,
        planets: []
      )
  end

end
