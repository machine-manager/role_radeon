alias Converge.{All, Util}

defmodule RoleRadeon do
	require Util
	import Util, only: [conf_file: 1, conf_dir: 1]

	def role(_tags \\ []) do
		%{
			desired_packages: [
				"firmware-amd-graphics",
				"xserver-xorg-video-radeon",
				# Steam needs this on Radeon even with STEAM_RUNTIME enabled
				"libgl1-mesa-glx:i386",
			],
			post_install_unit: %All{units: [
				conf_dir("/etc/X11"),
				conf_dir("/etc/X11/xorg.conf.d"),
				conf_file("/etc/X11/xorg.conf.d/20-radeon.conf"),
			]}
		}
	end
end
