class PlanetService

  def get_planets_from_ids(ids)
    return ids.map do |planet_id|
      Planet.find_by(id: planet_id)
    end.compact
  end
end


