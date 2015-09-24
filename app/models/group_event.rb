class GroupEvent < ActiveRecord::Base
  default_scope { where.not(removed: true) }

  enum status: [:draft, :published]

  validates_presence_of :name, :description,
    :location, :start_at, :end_at,
    :duration, if: :published?

  validates_numericality_of :duration, only_integer: true, allow_nil: true, greater_than: 0
  validate :start_at_cannot_be_later_than_end_at, if: -> { start_at.present? && end_at.present? }

  before_save :set_end_at,   if: -> { end_at.blank? && start_at.present? && duration.present? }
  before_save :set_duration, if: -> { duration.blank? && start_at.present? && end_at.present? }

  protected
    def set_end_at
      self.end_at = start_at + duration.days
    end

    def set_duration
      self.duration = (end_at.beginning_of_day - start_at.beginning_of_day) / 1.day
    end


    def start_at_cannot_be_later_than_end_at
      if start_at > end_at
        errors.add(:start_at, "can't be later than end_at")
      end
    end
end
