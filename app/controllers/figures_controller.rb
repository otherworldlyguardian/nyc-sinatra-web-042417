class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end


  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/new'
  end

  post '/figures' do
    figure = Figure.new(params[:figure])
    if !params[:landmark][:name].empty?
      figure.landmarks << Landmark.create(params[:landmark])
    end
    if !params[:title][:name].empty?
      figure.titles << Title.create(params[:title])
    end
    figure.save

    redirect "/figures/#{figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    figure = Figure.find(params[:id]).update(params[:figure])
    if !params[:landmark][:name].empty?
      figure.landmarks << Landmark.create(params[:landmark])
    end
    if !params[:title][:name].empty?
      figure.titles << Title.create(params[:title])
    end
    redirect "/figures/#{figure.id}"
  end
end
