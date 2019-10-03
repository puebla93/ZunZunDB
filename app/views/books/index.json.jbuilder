json.array!(@books) do |book|
  json.extract! book, :id, :title, :year, :author, :ilustrator, :photographer, :totalpages, :format, :editor, :editionyear, :editora, :isbn, :binding, :realisation, :designer, :correction, :clasification, :content, :banner, :troquelado, :collecttion
  json.url book_url(book, format: :json)
end
