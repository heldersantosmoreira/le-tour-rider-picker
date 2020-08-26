# frozen_string_literal: true

require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require_relative 'pick'
require_relative 'user'

enable :sessions

set :number_of_stages, 21
set :start_date, Date.new(2020, 8, 28)

get '/' do
  @users = User.order(:name).to_a
  @picks = Pick.all.to_a
  erb :index
end

post '/picks/create' do
  user = User.find_by(token: params[:user_token])

  if user.blank?
    flash[:warning] = 'Invalid token.'
  else
    pick = Pick.where(user_id: user.id, stage: params[:stage]).first_or_initialize

    if pick.persisted? && pick.visible?
      flash[:warning] = 'No can do. Your pick is already visible. Are you trying to cheat?'
    else
      pick.assign_attributes(rider_name: params['rider_name'], updated_at: Time.now.utc)
      pick.save

      if pick.persisted?
        flash[:warning] = 'Pick saved!'
      else
        flash[:warning] = "Couldn't save pick!"
      end
    end
  end

  redirect '/', 302
end

post '/picks/toggle' do
  user = User.find_by(token: params[:user_token])

  if user.blank?
    flash[:warning] = 'Invalid token.'
  else
    pick = user.picks.find_by(stage: params[:stage])

    if pick.present?
      pick.update(visible: !pick.visible)
      flash[:warning] = 'Pick updated!'
    else
      flash[:warning] = 'Pick for given stage does not exist.'
    end
  end

  redirect '/', 302
end
