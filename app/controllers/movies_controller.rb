class MoviesController < ApplicationController
before_action :authenticate_user!, :only => [:new, :create, :edit, :destroy, :update]
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def show
    @movie = Movie.find(params[:id])
    @reviews = @movie.reviews
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user = current_user
    if @movie.save
      redirect_to movies_path
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to movies_path
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  def join
    @movie = Movie.find(params[:id])
    if current_user.is_favorite?(@movie)
      你
    else
      current_user.join!(@movie)
    end
    redirect_to movie_path(@movie)
  end

  def quit
    @movie = Movie.find(params[:id])
    if current_user.is_favorite?(@movie)
      current_user.quit!(@movie)
    else
      不
    end
    redirect_to movie_path(@movie)
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description)
  end

end
