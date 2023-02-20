class PropertiesController < ApplicationController
  before_action :set_properties, only:[:show, :edit, :update, :destroy]

  def index
    @properties = Property.all
  end

  def new
    @property = Property.new
    @property.stations.build
    @property.stations.build
  end
  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to @property, notice: "保存しました"
    else
      render :new
    end
  end

  def show
  end

  def edit
    @property.stations.build
  end

  def update
    if @property.present?
      @property.update(property_params)
      redirect_to property_path(@property), notice: "保存しました"
    else
      render :edit
    end
  end

  def destroy
    @property.destroy
    redirect_to properties_path, notice: "削除しました"
  end

  private

  def set_properties
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:name, :rent, :address, :age, :remarks, stations_attributes: [:id, :line, :name, :walking_minutes, :property_id])
  end
end
