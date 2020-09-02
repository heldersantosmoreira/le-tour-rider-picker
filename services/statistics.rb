# frozen_string_literal: true

class Statistics
  def self.n_most_picked(number)
    Pick.eager_load(:rider, :stage)
        .where('stages.locked_at IS NOT NULL')
        .group('riders.name')
        .count
        .group_by { |_, v| v }
        .transform_values { |v| v.map(&:first) }
        .sort_by { |k, _| -k }
        .take(number)
  end

  def self.leaderboard
    Pick.eager_load(:user)
        .where('score IS NOT NULL')
        .group('users.name')
        .order('score_sum, timestamp_sum')
        .pluck(
          'users.name, SUM(score) AS score_sum, '\
          'SUM(cast(extract(epoch from rider_updated_at) as integer)) AS timestamp_sum'
        )
  end
end
