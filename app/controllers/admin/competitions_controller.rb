module Admin
  class CompetitionsController < BaseController
    before_action :set_competition, only: %i[edit update destroy]

    def index
      @competitions = Competition.ordered
    end

    def new
      @competition = Competition.new
    end

    def create
      @competition = Competition.new(competition_params)
      if @competition.save
        redirect_to admin_competitions_path, notice: "Competition created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @competition.update(competition_params)
        redirect_to admin_competitions_path, notice: "Competition updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @competition.destroy
      redirect_to admin_competitions_path, notice: "Competition deleted."
    end

    private

    def set_competition
      @competition = Competition.find(params[:id])
    end

    def competition_params
      params.require(:competition).permit(:name, :description, :position)
    end
  end
end
