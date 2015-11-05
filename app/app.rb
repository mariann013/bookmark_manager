require 'sinatra/base'
require_relative './models/link.rb'
require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'data_mapper_setup'


class BookmarkManager < Sinatra::Base
  get '/' do
    redirect '/links'
  end
  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb :new_link_form
  end

  post '/links' do
    link = Link.create(:url => params[:url], :title => params[:title])
    tag = Tag.create(:name => params[:tag])
    link.tags << tag
    link.save
    redirect '/links'
  end

  get '/search' do
    erb :search
  end

  post '/search' do
    p params[:tags]
    redirect "/tags/#{params[:tags]}"
  end

  get "/tags/:tag" do
    # p @tag = params[:tag]
    @tag = Tag.all(name: params[:tag])
    @links = @tag.links
    erb :results
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
