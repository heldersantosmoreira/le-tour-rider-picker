require_relative '../../models/stage'

START_DATE = DateTime.new(2020, 8, 29)
END_DATE = DateTime.new(2020, 9, 20)
REST_DAYS = [
  DateTime.new(2020, 9, 7),
  DateTime.new(2020, 9, 14),
].freeze

((START_DATE..END_DATE).to_a - REST_DAYS).each_with_index do |date, i|
  Stage.create!(number: i + 1, date: date)
end
