module UsersHelper
	def mood
		case @user.happiness
		when 1
			return "sad"
		when 2
			return "mad"
		when 3
			return "happy"
		end
	end

end
