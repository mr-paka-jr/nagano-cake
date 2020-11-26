class Admins::GenresController < Admins::BaseController
before_action :authenticate_admin!

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admins_genres_path
    else
      @genres = Genre.all
      render 'index'
    end
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
      if @genre.save
        redirect_to admins_genres_path
      else
        render action: :edit
      end
  end

    private
  def genre_params
    params.require(:genre).permit(:name, :is_active)
  end
end
