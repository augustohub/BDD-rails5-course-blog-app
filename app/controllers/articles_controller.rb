class ArticlesController < ApplicationController
  before_action :find_article, only: %i[show edit]

  def index;
    @articles = Article.all
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = 'Article has been created'
      redirect_to articles_path
    else
      flash.now[:danger] = 'Article has not been created'
      render :new
    end
  end

  def edit; end

  protected

  def resource_not_found
    message = 'The article you are looking for could not be found'
    flash[:alert] = message
    redirect_to root_path
  end

  private

  def find_article
    @article = Article.find(params[:id].to_i)
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
