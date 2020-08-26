# frozen_string_literal: true

class Pick < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :user, :stage, :rider_name

  def user_name
    user.name
  end

  def curated_rider_name
    visible ? rider_name.chomp : '*' * 5
  end

  def to_s
    "#{curated_rider_name} (#{created_at})"
  end
end
