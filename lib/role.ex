alias Converge.{All, Util}

defmodule RoleRadeon do
	require Util
	import Util, only: [conf_file: 1, conf_dir: 1]

	def role(_tags \\ []) do
		%{
			desired_packages: [
				"firmware-amd-graphics",
				"xserver-xorg-video-radeon",
				# For Steam, which needs this on Radeon even with STEAM_RUNTIME enabled
				"libgl1-mesa-glx:i386",
				# For 32-bit Windows games
				"libgl1-mesa-dri:i386",
				# For --hwdec=vdpau in mpv
				"vdpau-driver-all",
			],
			post_install_unit: %All{units: [
				conf_dir("/etc/X11"),
				conf_dir("/etc/X11/xorg.conf.d"),
				conf_file("/etc/X11/xorg.conf.d/20-radeon.conf"),
			]}
		}
	end
end
