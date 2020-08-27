# frozen_string_literal: true

require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require_relative 'pick'
require_relative 'user'
require_relative 'stage'

enable :sessions

set :number_of_stages, 21
set :start_date, Date.new(2020, 8, 28)
set :master_token, 'admin'

get '/' do
  @users = User.order(:name)
  @picks = Pick.all.to_a
  @stages = Stage.all.order(:created_at)
  erb :index
end

post '/picks/create' do
  user = User.find_by(token: params[:user_token])

  if user.blank?
    flash[:warning] = 'Invalid token.'
  else
    pick = Pick.where(user_id: user.id, stage: Stage.find_by(number: params[:stage_number])).first_or_initialize
    pick.assign_attributes(rider_name: params['rider_name'], updated_at: Time.now.utc)

    if pick.invalid?
      flash[:warning] = pick.errors.full_messages
    else
      pick.save!
    end
  end

  redirect '/', 302
end

post '/stage/lock' do
  stage = Stage.find_by(number: params['stage_number'])

  if stage.present?
    if stage.locked?
      flash[:warning] = 'Stage is already locked!'
    else
      stage.update(locked_at: Time.now.utc)

      flash[:warning] = 'Stage updated!'
    end
  else
    flash[:warning] =  "Couldn't find stage with given number!"
  end

  redirect '/', 302
end
