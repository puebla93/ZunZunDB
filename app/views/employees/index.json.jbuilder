json.array!(@employees) do |employee|
  json.extract! employee, :id, :name, :gender, :description
  json.url employee_url(employee, format: :json)
end
