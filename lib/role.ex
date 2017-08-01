defmodule RoleRadeon do
	def role(_tags \\ []) do
		%{
			desired_packages: [
				"xserver-xorg-video-radeon",
				# Steam needs this on Radeon even with STEAM_RUNTIME enabled
				"libgl1-mesa-glx:i386",
			],
		}
	end
end
