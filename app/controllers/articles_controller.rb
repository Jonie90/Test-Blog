class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
    respond_to do |format|
        format.html
        format.json {render json: @articles}
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    return redirect_to @article if @article.update(article_params)
    render 'edit'
    # if @article.update(article_params)
    #   redirect_to @article
    # else
    #   render 'edit'
    # end
  end

  def destroy
    if @article.destroy
      redirect_to articles_path
    else
      redirect_to articles_path
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end

end
