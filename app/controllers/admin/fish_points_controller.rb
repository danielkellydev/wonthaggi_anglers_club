module Admin
  class FishPointsController < BaseController
    before_action :set_fish_point, only: %i[edit update destroy]

    def index
      @fish_points = FishPoint.ordered
    end

    def new
      @fish_point = FishPoint.new
    end

    def create
      @fish_point = FishPoint.new(fish_point_params)
      if @fish_point.save
        redirect_to admin_fish_points_path, notice: "Fish point created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @fish_point.update(fish_point_params)
        redirect_to admin_fish_points_path, notice: "Fish point updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @fish_point.destroy
      redirect_to admin_fish_points_path, notice: "Fish point deleted."
    end

    private

    def set_fish_point
      @fish_point = FishPoint.find(params[:id])
    end

    def fish_point_params
      params.require(:fish_point).permit(:name, :points, :notes, :position)
    end
  end
end
