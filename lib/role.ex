defmodule RoleRadeon do
	def role(_tags \\ []) do
		%{
			desired_packages: ["xserver-xorg-video-radeon"],
		}
	end
end
