require 'rails_helper'

RSpec.describe "GroupEvents", type: :request do
  describe "GET /group_events" do
    let!(:events) { create_list(:group_event, 3) }
    let(:json)    { events.map { |event| event_as_json(event, false) }.to_json }

    it "works! (now write some real specs)" do
      get group_events_path(format: :json)
      expect(response).to have_http_status(200)
      expect(response.body).to eq(json)
    end
  end
end
