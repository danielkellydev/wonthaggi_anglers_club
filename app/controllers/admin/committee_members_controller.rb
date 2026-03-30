module Admin
  class CommitteeMembersController < BaseController
    before_action :set_committee_member, only: %i[edit update destroy]

    def index
      @committee_members = CommitteeMember.ordered
    end

    def new
      @committee_member = CommitteeMember.new
    end

    def create
      @committee_member = CommitteeMember.new(committee_member_params)
      if @committee_member.save
        redirect_to admin_committee_members_path, notice: "Committee member created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @committee_member.update(committee_member_params)
        redirect_to admin_committee_members_path, notice: "Committee member updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @committee_member.destroy
      redirect_to admin_committee_members_path, notice: "Committee member deleted."
    end

    private

    def set_committee_member
      @committee_member = CommitteeMember.find(params[:id])
    end

    def committee_member_params
      params.require(:committee_member).permit(:role, :name, :phone, :email, :position)
    end
  end
end
