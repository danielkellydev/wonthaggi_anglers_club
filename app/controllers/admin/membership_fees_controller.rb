module Admin
  class MembershipFeesController < BaseController
    before_action :set_membership_fee, only: %i[edit update destroy]

    def index
      @membership_fees = MembershipFee.ordered
    end

    def new
      @membership_fee = MembershipFee.new
    end

    def create
      @membership_fee = MembershipFee.new(membership_fee_params)
      if @membership_fee.save
        redirect_to admin_membership_fees_path, notice: "Membership fee created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @membership_fee.update(membership_fee_params)
        redirect_to admin_membership_fees_path, notice: "Membership fee updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @membership_fee.destroy
      redirect_to admin_membership_fees_path, notice: "Membership fee deleted."
    end

    private

    def set_membership_fee
      @membership_fee = MembershipFee.find(params[:id])
    end

    def membership_fee_params
      params.require(:membership_fee).permit(:name, :amount, :description, :position)
    end
  end
end
