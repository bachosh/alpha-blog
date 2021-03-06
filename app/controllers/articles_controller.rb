class ArticlesController<ApplicationController
  
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def index
   # @all_articles=Article.all  paging is dasamateblad shevcvale.  gem failis mixedvit
   @all_articles=Article.paginate(page: params[:page], per_page: 5)  # 5 chanaweri ert gverdze
  end
  
  
  
  # GET /articles/new
  def new
    @article = Article.new
  end
  
  def edit
   # @article=Article.find(params[:id])
  end
  

  def create
    # linkidan pirdapir gadmocemuli parameterbis mnishvnelobis minicheba @article cvladistvis
    # amisatvis metods=article_params vqmnit 
     @article = Article.new(article_params)
     @article.user=current_user
    # axal chanawerebs rom gaaketebs bazashi mere gadadis show gverdze. uamisod ar icis sad wavides da errori gamodis ekranze

    
    if @article.save # tu validaciebi gaiara (module.rb shi rac weria)
        flash[:success] = "Article was successfully created" # shetyobinebis gamotana
        redirect_to article_path(@article)
      
    else
      
      render 'new'
    end
    
    
  end
  
  
  def update
    # @article=Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] ="Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end


# linki aris es sadac gadadis  
# https://ruby-on-rails-bacho.c9users.io/articles/7  
# bolo 7 aris id parametri articles romlis mixedvitac unda avawyot chveneba
# amisatvis amas vikenebt
  def show
   # @article=Article.find(params[:id])
  end
  
  def destroy
    # @article=Article.find(params[:id])
    @article.destroy
    flash[:danger] = "Article was successfully deleted"
    redirect_to articles_path
  end
  
  
  
  private
  
   def set_article
     @article=Article.find(params[:id])
   end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :description , category_ids:[])
      # category_ids:[] gamoiyeneba create actionshi @article = Article.new(article_params) aq ketdeba whitelist ingi
      #[] aris array form
      # radgan cxrilebs shoris gawerilia constraintebi, 
      # @article rails avtomaturad xvdeba masivshi ra uyos
    end
    
    def require_same_user
      if current_user!=@article.user and !current_user.admin?
        flash[:danger] = 'you can only edit or delete your own articles'
        redirect_to root_path
      end
    end
end  