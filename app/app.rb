ENV['RACK_ENV'] = 'development'

require 'sinatra/base'
require_relative './models/link.rb'
require_relative './models/user.rb'
require_relative 'data_mapper_setup'
require 'data_mapper'
require 'dm-postgres-adapter'


class BookmarkManager < Sinatra::Base
  enable 'sessions'
  set :secret_session, 'secret stuff'
  
  get '/' do
    erb :homepage
  end

  get '/signin' do
    redirect '/links'
  end

  get '/registration' do
    erb :registration
  end

  post '/registration' do
    user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
    session[:user_id] = user.id
    redirect to '/links'
  end

  get '/links' do
    @user_count = User.count
    user = User.first
    @username = user.username unless user.nil?
    @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb :new_link_form
  end

  post '/links' do
    link = Link.create(:url => params[:url], :title => params[:title])
    tags = params[:tag]
    tags.split.each do |tag|
      link.tags << Tag.create(:name => tag)
    end
    link.save
    redirect '/links'
  end

  get '/search' do
    erb :search
  end

  post '/search' do
    redirect "/tags/#{params[:tags]}"
  end

  get "/tags/:tag" do
    @tag = Tag.all(name: params[:tag])
    @links = @tag.links
    erb :results
  end

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
