json.array!(@group_events) do |group_event|
  json.extract! group_event, :id, :name, :description, :location, :start_at, :end_at, :status, :removed, :duration
  json.url group_event_url(group_event, format: :json)
end
