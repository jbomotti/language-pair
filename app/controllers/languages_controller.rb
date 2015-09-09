class LanguagesController < ApplicationController

  def index
    @languages = Language.all
  end

  def new
    @language = Language.new
  end

  def create
    @language = Language.new(language_params)

    if @language.save
      redirect_to languages_path
    else
      render 'new'
    end
  end

  def show
    @languages = Language.all
  end

  private
  def language_params
    params.require(:language).permit(:name)
  end

end
