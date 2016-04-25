json.array!(@articles) do |article|
  json.extract! article, :id, :title, :author, :ilustrator, :photographer, :gender, :subject, :magazineId, :colorist, :totalpages, :pdf, :thematicdesing, :original, :originallocation, :section
  json.url article_url(article, format: :json)
end
