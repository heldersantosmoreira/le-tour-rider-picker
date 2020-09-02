# frozen_string_literal: true

require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'sinatra/json'
require 'sinatra/reloader'
require 'sinatra/respond_with'
require_relative 'models/pick'
require_relative 'models/user'
require_relative 'models/stage'
require_relative 'models/rider'
require_relative 'services/statistics'

enable :sessions

get '/' do
  @users = User.order(:name)
  @picks = Pick.all.eager_load(:stage, :user, :rider).to_a
  @stages = Stage.all.order(:created_at)
  @number_of_riders = Rider.count
  @most_picked = Statistics.n_most_picked(5)
  @leaderboard = Statistics.leaderboard

  erb :index
end

post '/picks' do
  user = User.find_by(token: params[:user_token])

  if user.blank?
    flash[:warning] = 'Invalid token.'
  else
    pick = Pick.where(user_id: user.id, stage: Stage.find_by(number: params[:stage_number])).first_or_initialize
    pick.assign_attributes(
      rider: Rider.find_by(name: params['rider_name']),
      rider_updated_at: Time.now.utc
    )

    if pick.save
      flash[:warning] = 'Pick created/updated successfully.'
    else
      flash[:warning] = pick.errors.full_messages
    end
  end

  redirect '/', 302
end

post '/stage/lock' do
  stage = Stage.find_by(number: params['stage_number'])

  if stage.present?
    stage.locked_at = Time.now.utc

    if stage.save
      flash[:warning] = 'Stage updated!'
    else
      flash[:warning] = stage.errors.full_messages
    end
  else
    flash[:warning] = "Couldn't find stage with given number!"
  end

  redirect '/', 302
end

get '/rider' do
  @riders = Rider.limit(10)
  @riders = @riders.where('name ILIKE ?', "%#{params[:search]}%") if params[:search]

  json @riders
end

post '/picks/scores' do
  scores = (params['picks'] || {}).select { |_, v| v.present? }

  scores.each do |pick_id, score|
    Pick.find_by(id: pick_id).update(score: score.to_i)
  end

  flash[:warning] = 'Scores updated.'

  redirect '/', 302
end
