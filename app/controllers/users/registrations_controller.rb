class Users::RegistrationsController < Devise::RegistrationsController
	respond_to :json

	private

	def respond_with(resource, options={})
		if resource.persisted?
			render json: {
				status: {code: 200, message: "singed-up Successfully"}
			}
		else
			render json: {
				status: {message: "User could not be created successfully", errors: resource.errors.full_messages}, status: :unprocessable_entity
			}
		end 
	end 
end
