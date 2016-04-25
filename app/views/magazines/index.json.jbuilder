json.array!(@magazines) do |magazine|
  json.extract! magazine, :id, :number, :month, :year, :cd, :issn
  json.url magazine_url(magazine, format: :json)
end
