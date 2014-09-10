require_dependency "supportify/supportify_controller"

module Supportify
  class ArticlesController < SupportifyController
    before_filter :set_article, except: [:new, :index, :create]
    
    # GET /articles
    def index
      @articles = Article.where(locale: I18n.locale)
    end

    # GET /articles/1
    def show
    end

    # GET /articles/new
    def new
      @article = Article.new
      @article.locale = I18n.locale
    end

    # GET /articles/1/edit
    def edit
    end

    # POST /articles
    def create
      @article = Article.new(article_params)
      @article.author = self.send(Supportify.current_user_method)
      if @article.save
        redirect_to @article, notice: 'Article was successfully created.'
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /articles/1
    def update
      if @article.update(article_params)
        redirect_to @article, notice: 'Article was successfully updated.'
      else
        render action: 'edit'
      end
    end

    # DELETE /articles/1
    def destroy
      @article.destroy
      redirect_to articles_url, notice: 'Article was successfully destroyed.'
    end

    private
    # Only allow a trusted parameter "white list" through.
    def article_params
      params.require(:article).permit(:title, :slug, :locale, :body, :published, :image, :image_cache, :tag_list, :category_list, :admin_tag_list)
    end
    
    def set_article
      @article = Article.find(params[:id])
    end
  end
end
