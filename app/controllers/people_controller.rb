class PeopleController < ApplicationController

  before_action :set_people, only: [:show, :edit, :update, :destroy]

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
    people = PeopleService.new.get_planets_from_ids(film_params[:planets])

    data = people_params.dup
    data[:people] = people

    if @people.update(data)
      render json: @people, include: :people
    else
      render json: @people.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @people.destroy
    head :no_content
  end

  private

  def set_people
    @people = People.find_by(id: params[:id])

    unless @people
      render json: { error: "people not found" }, status: :not_found
    end
  end

  def people_params
    params
      .require(:people)
      .permit(
        :name,
        :birth_year,
        :eye_color,
        :gender,
        :hair_color,
        :height,
        :mass,
        :skin_color,
        :homeworld,
        :created,
        :edited,
        planets: []
      )
  end

end
