# 📂 NixOS Nemo

> Declarative NixOS module to create and secure a per-user Nemo configuration directory, no config files included.

## 📦 Features

- 🔒 **Secure config directory :** Creates ```~/.config/nemo``` with ```700``` permissions and correct ownership.

- 🔄 **Idempotent :** Cleans and recreates the directory on each rebuild without removing user files.

- ⚙️ **Zero-config setup :** No configuration files provided, just the directory scaffold.

- 💾 **Backup guidance :** Documentation outlines how to back up an existing ```~/.config/nemo``` before use.

## ⚙️ Prerequisites

### 1. NixOS version
Requires NixOS 24.11 or newer.

### 2. User validation
the target user must be defined in ```config.username```. See [typovrak main nixos configuration](https://github.com/typovrak/nixos) for more details.

### 3. Backup
Before proceeding, back up existing configuration if needed
```bash
cp ~/.config/nemo{,.bak}
```

## 🚀 Installation
Fetch the module directly in your main nixos configuration at ```/etc/nixos/configuration.nix``` using fetchGit
```nix
# /etc/nixos/configuration.nix

let
  nixos-nemo = fetchGit {
    url = "https://github.com/typovrak/nixos-nemo.git";
    ref = "main";
    rev = "924b68b04123a0716bcd16eaa6c329e13ec148f5"; # update to the desired commit
  };
in
{
  imports = [
    /etc/nixos/hardware-configuration.nix # system hardware settings
    /etc/nixos/variables.nix # defines config.username and other variables, see https://github.com/typovrak/nixos for more details
    (import "${nixos-nemo}/configuration.nix")
  ];
}
```

Once imported, rebuild your system to apply changes
```bash
sudo nixos-rebuild switch
```

## 🎬 Usage

Verify the directory
```bash
ls -ld ~/.config/nemo # drwx------, owned by your user
```

Then launch this file explorer with the ```nemo``` command.

## ❤️ Support

If this module saved you time, please ⭐️ the repo and share feedback.  
You can also support me on ☕ [Buy me a coffee](https://www.buymeacoffee.com/typovrak).

## 📝 License

Distributed under the [MIT license](LICENSE.md).

## 📜 Code of conduct

This project maintains a [code of conduct](.github/CODE_OF_CONDUCT.md) to ensure a respectful, inclusive and constructive community.

## 🛡️ Security

To report vulnerabilities or learn about supported versions and response timelines, please see our [security policy](.github/SECURITY.md).

---

<p align="center"><i>Made with 💜 by typovrak</i></p>
