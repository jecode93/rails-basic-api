class Api::V1::ArticlesController < ApplicationController
  before_action :set_id, only: %i[ show update destroy ]
  
  # GET /Articles
  def index
    @articles = Article.all.order('created_at DESC')
    render json: {
      status: 'SUCCESS',
      message: 'Loaded articles',
      data: @articles
    }, status: :ok
  end
  
  # GET /Articles/1
  def show
    if @article
      render json: {
        status: 'SUCCESS',
        message: 'Loaded article',
        data: @article
      }, status: :ok
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # POST /Articles
  def create
    @article = Article.new(article_params)
    
    if @article.save
      render json: {
        status: 'SUCCESS',
        message: 'Article added successfully',
        data: @article
      }, status: :ok
    else
      render json: @article, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /Articles/1
  def update
    if @article.update(article_params)
      render json: {
        status: 'SUCCESS',
        message: 'Article updated successfully',
        data: @article
      }, status: :ok
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # DELETE /Articles/1
  def destroy
    if @article.destroy
      render json: {
        status: 'SUCCESS',
        message: 'Data deleted successfully',
        data: @article
      }
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end
  
  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_id
    @article = Article.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:title, :body)
  end
end
