class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
    respond_to do |format|
      format.html
      format.json { render json: @kittens }
    end
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(user_params)
    if @kitten.save
      redirect_to @kitten, notice: "Your kitten was purrr-fectly created."
    else
      render 'new'
    end
  end

  def show
    @kitten = Kitten.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @kitten }
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update_attributes(user_params)
      flash[:success] = "Kitten was purrr-fectly updated."
      redirect_to @kitten
    else
      render 'edit'
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id]).delete
    redirect_to root_path
  end

  private

  def user_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
