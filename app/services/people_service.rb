class PeopleService

  def get_people_from_ids(ids)
    return ids.map do |people_id|
      People.find_by(id: people_id)
    end.compact
  end
end