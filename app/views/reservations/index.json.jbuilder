json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :house_id, :user_id, :from, :until
  json.url reservation_url(reservation, format: :json)
end
