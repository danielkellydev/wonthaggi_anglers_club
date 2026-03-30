module Admin
  class SiteSettingsController < BaseController
    def edit
      @membership_form = SiteSetting.find_or_create_by!(key: "membership_form")
    end

    def update
      @membership_form = SiteSetting.find_or_create_by!(key: "membership_form")
      if params[:site_setting][:file].present?
        @membership_form.file.attach(params[:site_setting][:file])
        redirect_to edit_admin_site_settings_path, notice: "Membership form updated."
      else
        redirect_to edit_admin_site_settings_path, alert: "Please select a file to upload."
      end
    end

    def destroy_file
      @membership_form = SiteSetting.find_by(key: "membership_form")
      @membership_form&.file&.purge
      redirect_to edit_admin_site_settings_path, notice: "Membership form removed."
    end
  end
end
