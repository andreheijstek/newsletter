json.array!(@letters) do |letter|
  json.extract! letter, :id, :welcome, :date, :time1, :time2, :announcements, :liturgy
  json.url letter_url(letter, format: :json)
end
