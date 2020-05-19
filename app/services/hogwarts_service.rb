class HogwartsService

  def wizards_by_house(house)
    params = { house: house}
    json = get_json('characters', params)
  end

  private

  def conn
    Faraday.new('https://www.potterapi.com/v1/') do |f|
      f.params[:key] = ENV['HOGWARTS_API_KEY']
    end

  end

  def get_json(url, params)
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_headers: true)
  end
end
