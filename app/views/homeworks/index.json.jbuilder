json.array!(@homeworks) do |homework|
  json.extract! homework, :id, :name, :attachment, :info
  json.url homework_url(homework, format: :json)
end
