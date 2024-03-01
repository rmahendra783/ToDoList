class Users::SessionsController < Devise::SessionsController
	respond_to :json

	private

	def respond_with(resource, options={})
		render json: {

			status: {code: 200, message: "Signed In successfully"}, status: :ok
		}

	end 


	def respond_to_on_destroy
		jwt_payload = JWT.decode(request.headers['Authorization']).split('')[1], rails.application.credentials.fetch(:secert_key_base).first
		current_user = User.find(jwt_payload['sub'])
		if current_user
			render json: {status: 200, message: "singed-out"}, status: :ok

		else
			render json: {status: 401, message: "not Authorization"}, status: :unauthorized
		end 

	end 

end
