module Admin
  class AboutSectionsController < BaseController
    before_action :set_about_section, only: %i[edit update destroy]

    def index
      @about_sections = AboutSection.ordered
    end

    def new
      @about_section = AboutSection.new
    end

    def create
      @about_section = AboutSection.new(about_section_params)
      if @about_section.save
        redirect_to admin_about_sections_path, notice: "Section created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @about_section.update(about_section_params)
        redirect_to admin_about_sections_path, notice: "Section updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @about_section.destroy
      redirect_to admin_about_sections_path, notice: "Section deleted."
    end

    private

    def set_about_section
      @about_section = AboutSection.find(params[:id])
    end

    def about_section_params
      params.require(:about_section).permit(:title, :body, :position, :published)
    end
  end
end
