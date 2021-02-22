class Admin::CategoriesController < Admin::AdminController
  def index
    @categories = Category.all
  end

  def new
    @categories = Category.all
    @category = Category.new
  end

  def create
    @category = Category.new(required_params)
    if @category.save
      flash[:notice] = 'Cadastrado com sucesso'
      redirect_to action: :index
    else
      flash[:alert] = 'Dados invalidos'
      @categories = Category.all
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @categories = Category.all
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(required_params)
      flash[:notice] = 'Editado com sucesso'
      redirect_to action: :index
    else
      flash[:alert] = 'Dados invalidos'
      @categories = Category.all
      render :edit
    end
  end

  def destroy
    if Category.find(params[:id]).destroy
      flash[:notice] = 'Deletado com sucesso'
    else
      flash[:alert] = 'Houve um erro'
    end
    redirect_to action: :index
  end

  private

  def required_params
    params.require(:category).permit(:name, :parent_id)
  end
end