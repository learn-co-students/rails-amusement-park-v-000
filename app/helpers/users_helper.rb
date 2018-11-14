module UsersHelper

	def mood_string(user)
		n = user.happiness

		if n == 1
			'sad'
		elsif n == 3
			'happy'
		else
			'unknown'
		end
	end
end
