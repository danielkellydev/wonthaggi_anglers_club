module Admin
  class FishOfTheMonthsController < BaseController
    before_action :set_fish_of_the_month, only: %i[edit update destroy]

    def index
      @fish_of_the_months = FishOfTheMonth.ordered
    end

    def new
      @fish_of_the_month = FishOfTheMonth.new
    end

    def create
      @fish_of_the_month = FishOfTheMonth.new(fish_of_the_month_params)
      if @fish_of_the_month.save
        redirect_to admin_fish_of_the_months_path, notice: "Entry created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @fish_of_the_month.update(fish_of_the_month_params)
        redirect_to admin_fish_of_the_months_path, notice: "Entry updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @fish_of_the_month.destroy
      redirect_to admin_fish_of_the_months_path, notice: "Entry deleted."
    end

    private

    def set_fish_of_the_month
      @fish_of_the_month = FishOfTheMonth.find(params[:id])
    end

    def fish_of_the_month_params
      params.require(:fish_of_the_month).permit(:fishing_date, :target_species, :special_event)
    end
  end
end
