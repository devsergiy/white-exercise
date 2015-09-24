require 'rails_helper'

RSpec.describe "GroupEvents", type: :request do
  describe "GET /group_events" do
    let!(:events) { create_list(:group_event, 3) }
    let(:json) do
      events.map do |event|
        event.as_json.slice(*%w(id name description location start_at end_at status removed duration)).
          merge!({ url: group_event_url(event, format: :json) })
      end.to_json
    end

    it "works! (now write some real specs)" do
      get group_events_path(format: :json)
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to eq(JSON.parse(json))
    end
  end
end
