require_relative '../../models/user'

[
  'Admilo',
  'André',
  'Bruno',
  'Hélder',
  'José Pedro',
  'Tiago',
].each do |name|
  User.create!(token: SecureRandom.hex(4), name: name)
end
