# nixos-nemo

nixos-nemo = fetchGit {
	url = "https://github.com/typovrak/nixos-nemo.git";
	ref = "main";
};

(import "${nixos-nemo}/configuration.nix")
