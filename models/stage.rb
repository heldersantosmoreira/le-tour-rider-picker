# frozen_string_literal: true

class Stage < ActiveRecord::Base
  has_many :picks

  def locked?
    locked_at.present?
  end

  def lockable?
    !locked? && date < Time.now
  end
end
