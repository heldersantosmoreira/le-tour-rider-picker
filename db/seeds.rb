require 'i18n'

NUMBER_OF_STAGES = 21
START_DATE = DateTime.new(2020, 9, 28)

0.upto(NUMBER_OF_STAGES - 1) do |n|
  Stage.create!(number: n + 1, date: START_DATE + n.days)
end

[
  'Hélder',
  'André',
  'Tiago',
  'Bruno',
  'Admilo',
  'José Pedro',
].each do |name|
  User.create!(token: SecureRandom.hex(4), name: name)
end
