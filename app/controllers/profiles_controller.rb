	class ProfilesController < ApplicationController

		def show
			@farmie = current_farmie
			@profile = Profile.find(params[:id])
		end

		def edit
			@farmie = current_farmie
			@profile = Profile.find(params[:id])
		end

		def update
			@profile = Profile.find(params[:id])

			if @profile.update_attributes(profile_params)
				flash[:success] = "Profile updated"
				redirect_to farmie_profile_url
			else
				render edit_farmie_profile_path
		end
	end

	private

		def profile_params
			params.require(:profile).permit(:picture, :about, :intro, :farmie_id, :show_visited_farms, 
        {farmie_pictures_attributes: [:id, :profile_id, :farmie_id, :image_path]})
        
		end
	end