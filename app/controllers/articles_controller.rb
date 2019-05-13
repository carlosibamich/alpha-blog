class ArticlesController < ApplicationController
  # before_action :set_article

  def index
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    @article.save
  end

  def update
  end

  def destroy
  end

  private
  # def set_article
  #   @article = Article.find(params[:id])
  # end
  #
  def article_params
    params.require(:article).permit(:title, :body)
  end
end
