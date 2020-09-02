# frozen_string_literal: true

class Stage < ActiveRecord::Base
  has_many :picks

  validate :ensure_lockable_stage

  def ensure_lockable_stage
    if locked_at_was.present?
      errors.add(:stage, 'is already locked')
    elsif !lockable?
      errors.add(:stage, 'cannot be locked yet')
    end
  end

  def locked?
    locked_at.present?
  end

  def lockable?
    date < Time.now
  end
end
