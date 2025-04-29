{ config, pkgs, ... }:

let
	username = config.username;
	group = config.users.users.${username}.group or "users";
	home = config.users.users.${username}.home;
in {
	system.activationScripts.nemo = ''
		mkdir -p ${home}/.config
		chown ${username}:${group} ${home}/.config
		chmod 700 ${home}/.config

		rm -rf ${home}/.config/nemo
		mkdir ${home}/.config/nemo
		chown ${username}:${group} ${home}/.config/nemo
		chmod 700 ${home}/.config/nemo
	'';

	environment.systemPackages = with pkgs; [
		nemo
	];
}
