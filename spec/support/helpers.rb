module Helpers
  def event_as_json(event, json = true)
    data = event.as_json.slice(*%w(id name description location start_at end_at status duration created_at updated_at)).
      merge!({ url: group_event_url(event, format: :json) })

    if json
      data.to_json
    else
      data
    end
  end
end
