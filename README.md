# :wrench: snippets.sh

A collection of handy shell scripts.

## OpenFortiVPN Setup Script

This script allows you to securely connect to a Fortinet VPN using `openfortivpn` and retrieves your VPN password from the `pass` credential manager. It dynamically creates a configuration file to avoid storing passwords in plaintext.

### Requirements

Ensure the following are installed on your system:
- [**pass**](https://www.passwordstore.org/)
- [**openfortivpn**](https://github.com/adrienverge/openfortivpn)

### Setting up the script

1. Make the Script Executable

Download or copy the bash script (`vpn/start.sh`) and make it executable:
```
chmod +x ./vpn/start.sh
```

2. Configure the Template

Copy `config/template.conf` to `config/example.conf` and replace the placeholder values with your VPN details, except for the password:

```
host = your.gateway.address
port = 443               # or specify the correct port
username = your_username
password = __PASSWORD__  # leave this placeholder as is
```

3. Store the VPN Password Using pass

Store your VPN password in pass, using a descriptive path like vpn/password:
```
pass insert vpn/password
```

Follow the prompts to securely save the password.

4. Run the Script with Password Retrieval

Use the script to start the VPN session. Pass the path to the password in pass and the path to the config file as arguments:

```
./vpn/start.sh vpn/password config/example.conf
```

5. Set Up an Alias (Optional)

To make it easier to run the VPN connection script, create an alias. Add the following line to your `~/.bashrc` or `~/.zshrc` file:
```
alias vpn_example_start="~/path/to/vpn/start.sh vpn/password ~/path/to/vpn/config/example.conf"
```

Reload your shell configuration:
```
source ~/.bashrc  # or `source ~/.zshrc` for zsh users
```
