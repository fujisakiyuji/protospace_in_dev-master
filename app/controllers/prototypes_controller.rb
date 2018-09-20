class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :update]
  protect_from_forgery :except => [:edit, :update]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to :root, notice: 'New prototype was successfully created'
    else
      redirect_to ({ action: new }), alert: 'YNew prototype was unsuccessfully created'
     end
  end

  def show
  end

  def edit
        @prototype = Prototype.find(params[:id])

  end

  def update
    # prototype = Prototype.find(params[:id])
    @prototype.update(prototype_params)
    redirect_to :root, notice: 'Prototype was successfully updated.'
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      :user_id,
      captured_images_attributes: [:id, :content, :status]
    )
  end
end
