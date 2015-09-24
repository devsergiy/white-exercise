json.extract! @group_event, :id, :name, :description, :location,
  :start_at, :end_at, :status, :duration, :created_at, :updated_at

json.url group_event_url(@group_event, format: :json)
