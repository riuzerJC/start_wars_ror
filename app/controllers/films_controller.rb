class FilmsController < ApplicationController

  before_action :set_film, only: [:show, :edit, :update, :destroy]
  def index
    films = Film.all

    render json: films
  end

  def show
    render json: @film
  end

  def create
    film = Film.new(film_params)

    if film.save
      render json: film, status: :created
    else
      render json: film.errors, status: :unprocessable_entity
    end
  end

  def update
    if @film.update(film_params)
      render json: @film
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
    @film = Film.find(params[:id])
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
        :release_date
      )
  end
end
