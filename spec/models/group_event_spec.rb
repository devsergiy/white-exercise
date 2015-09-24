require 'rails_helper'


ATTRS = [:name, :description, :location, :start_at, :end_at, :duration ]

RSpec.describe GroupEvent, type: :model do
  describe "validations" do

    ATTRS.each do |attr|
      it { should_not validate_presence_of(attr) }
    end

    context "published" do
      before { subject.status = :published }

      ATTRS.each do |attr|
        it { should validate_presence_of(attr) }
      end
    end

    it { should validate_numericality_of(:duration).only_integer.allow_nil.is_greater_than(0) }

    context "start_at greater than end_at" do
      let(:bad_event) { build(:group_event, start_at: Time.now + 10.days, end_at: Time.now) }

      it "expect record to be not valid" do
        expect(bad_event.valid?).to be_falsey
        expect(bad_event.errors.keys).to include(:start_at)
      end
    end

  end

  describe "default scope" do
    let!(:removed) { create :removed_event }
    let!(:present) { create :group_event }

    it 'orders by ascending name' do
      expect(GroupEvent.all).to eq [present]
    end
  end

  describe "#set_duration" do
    let(:start_time)       { Time.zone.now }
    let(:desired_duration) { 11 }
    let(:end_time)         { start_time + desired_duration.days }

    let(:event) { build(:group_event, start_at: start_time, end_at: end_time, duration: nil) }

    it "should set end time" do
      event.save
      expect(event.duration).to eq(desired_duration)
    end
  end

  describe "#set_end_at" do
    let(:start_time)  { Time.zone.now }
    let(:duration)    { 10 }
    let(:desired_end) { start_time + duration.days }

    let(:event) { build(:group_event, start_at: start_time, end_at: nil, duration: duration) }

    it "should set end time" do
      event.save
      expect(event.end_at).to eq(desired_end)
    end
  end
end
