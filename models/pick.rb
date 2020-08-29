# frozen_string_literal: true

class Pick < ActiveRecord::Base
  belongs_to :user
  belongs_to :stage
  belongs_to :rider

  validates :rider, :user, :stage,  presence: { message: 'is invalid' }
  validate :ensure_unlocked_stage
  validates_numericality_of :score, allow_nil: true

  def ensure_unlocked_stage
    return unless stage&.locked?

    errors.add(:stage, 'is invalid because it is locked')
  end

  def user_name
    user.name
  end

  def curated_rider_name
    stage.locked? ? rider.name.chomp : '*' * 5
  end

  def to_s
    "#{curated_rider_name} (#{updated_at.to_time.localtime('+01:00').strftime('%Y-%m-%d %H:%M:%S')})"
  end
end
