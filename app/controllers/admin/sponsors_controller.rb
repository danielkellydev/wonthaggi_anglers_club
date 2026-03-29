module Admin
  class SponsorsController < BaseController
    before_action :set_sponsor, only: %i[edit update destroy]

    def index
      @sponsors = Sponsor.ordered
    end

    def new
      @sponsor = Sponsor.new
    end

    def create
      @sponsor = Sponsor.new(sponsor_params)
      if @sponsor.save
        redirect_to admin_sponsors_path, notice: "Sponsor created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @sponsor.update(sponsor_params)
        redirect_to admin_sponsors_path, notice: "Sponsor updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @sponsor.destroy
      redirect_to admin_sponsors_path, notice: "Sponsor deleted."
    end

    private

    def set_sponsor
      @sponsor = Sponsor.find(params[:id])
    end

    def sponsor_params
      params.require(:sponsor).permit(:name, :logo, :website_url, :position)
    end
  end
end
