class LibrariesController < ApplicationController
	before_action :logged_in?, only: [:new]
	before_action :logged_in?, only: [:index]

	def index
    @libraries = Library.all
    current_user # sets @current_user
    render :index
  end

  def new
    @library = Library.new
    render :new
  end
  def create
    @library = Library.create(library_params)

    redirect_to "/libraries"
  end
end

  private

  def library_params
    params.require(:library).permit(:name, :floor_count, :floor_area)
  end
