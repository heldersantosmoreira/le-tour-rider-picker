# frozen_string_literal: true

class Rider < ActiveRecord::Base
  has_many :picks
end
