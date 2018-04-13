class ProfilesController < ApplicationController

	def edit
		@farmie = current_farmie
		@profile = Profile.find(params[:id])
	end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update_attributes(profile_params)
      flash[:success] = "Profile updated"
      redirect_to farmie_profile
    else
      render edit_farmie_profile
    end
  end

  private

  	def profile_params
  		params.require(:profile).permit(:about, :intro, :farmie_id, :show_visited_farms)
  	end

end