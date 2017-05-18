class LandmarksController < ApplicationController

    get '/landmarks' do
      @landmarks = Figure.all
      erb :'/landmarks/index'
    end


    get '/landmarks/new' do
      @figures = Landmark.all
      @titles = Title.all
      erb :'/landmarks/new'
    end

    post '/landmarks' do
      figure = Landmark.new(params[:landmark])
      if !params[:figure][:name].empty?
        landmark.figures << Landmark.create(params[:figure])
      end
      if !params[:title][:name].empty?
        landmark.titles << Title.create(params[:title])
      end
      landmark.save

      redirect "/landmarks/#{landmark.id}"
    end

    get '/landmarks/:id' do
      @landmark = Landmark.find(params[:id])
      erb :'/landmarks/show'
    end

    get '/landmarks/:id/edit' do
      @landmark = Landmark.find(params[:id])
      @figures = Figure.all
      @titles = Title.all
      erb :'/landmarks/edit'
    end

    patch '/landmarks/:id' do
      landmark = Landmark.find(params[:id]).update(params[:figure])
      if !params[:figure][:name].empty?
        landmark.figures << Figures.create(params[:figure])
      end
      if !params[:title][:name].empty?
        landmark.titles << Title.create(params[:title])
      end
      redirect "/landmarks/#{landmark.id}"
    end
  end
