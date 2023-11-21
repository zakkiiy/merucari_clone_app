class UserInformationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @user_information = current_user.build_user_information
  end

  def create
    @user_information = current_user.build_user_information(user_information_params)
    puts @user_information.errors.full_messages
    if @user_information.save
      puts @user_information.errors.full_messages
      redirect_to :root, notice: "個人情報の登録に成功しました"
    else
      flash.now.alert = "個人情報の登録に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_information_params
    params.require(:user_information).permit(
      :family_name,
      :given_name,
      :family_name_kana,
      :given_name_kana,
      :birth_date
    )
  end
end