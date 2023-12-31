class CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :edit, :update, :destroy]
  

  def index
    @categories = Category.where(user_id: current_user.id)
    @tasks = Task.where(category_id:current_user.categories.map(&:id))
  end

  def show
    @categories = Category.find(params[:id])

  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to root_path, notice: "Category was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    if @category.update(category_params)
      redirect_to root_path, notice: "Category was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to root_path, notice: "Category was successfully destroyed."
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:category_name,:user_id)
  end
end