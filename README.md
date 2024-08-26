<p align="center">
  <img src="docs/assets/logo.png" alt="Logfile to Discord logo" width="200"
  style = "border-radius: 10%;"/>
</p>

<h1 align="center">Logfile to Discord</h1>

<p align="center">
  <strong>Manage your server logs directly from a Discord channel</strong>
</p>

<p align="center">
  <a href="#prerequisites">Pre-requisites</a> •
  <a href="#usage">Usage</a> •
  <a href="#license">License</a> •
  <a href="#contributing">Contributing</a>
</p>

<p align="center">
  <a href="https://discord.gg/7qK8sfEq2q">
    <img src="https://img.shields.io/discord/1068543728274382868?color=7289da&label=Support&logo=discord&logoColor=7289da&style=for-the-badge" alt="Discord">
  </a>
  <a href="https://www.gnu.org/software/bash/">
    <img src="https://img.shields.io/github/languages/top/ovosimpatico/logfile-to-discord?logo=gnubash&logoColor=yellow&style=for-the-badge" alt="Language">
  </a>
  <a href="https://github.com/ovosimpatico/logfile-to-discord/blob/main/LICENSE">
    <img src="https://img.shields.io/github/license/ovosimpatico/logfile-to-discord?style=for-the-badge" alt="License">
  </a>
</p>

## Prerequisites

You must have `curl` installed in order to work. Use the package manager on your Linux distro to install it.


## Usage

To use this script, follow the steps below:

1. Clone this repository to your local machine:

   ```shell
   git clone https://github.com/nanometer5088/logfile-to-discord.git
   ```

    The script requires some information to be edited before running:

2. Edit the `log_broadcast.sh` script:

   - Set the `LOG_FILE` variable to the path of your log file.
   - Replace `ENTER YOUR WEBHOOK LINK HERE` with your Discord webhook URL in the `DISCORD_WEBHOOK_URL` variable.
   - Replace `"SERVICE ON LOG"` in the script to match the software you want to broadcast. This way, not every line will be sent to discord, only new lines from a specific software or service.
   - Replace `"FILTER"` with the message prior to the actual log message. This results in clean messages.
   - Replace `"DISCORD USER ID"` with your User ID. You will be tagged on Discord when the message is sent.

3. Move the `log_broadcast.sh` script to a suitable location, e.g., `/opt/log_broadcast.sh`.

4. Edit the `log_broadcast.service` file:

   - Set the `ExecStart` path to the location of the `log_broadcast.sh` script.
   - (optional) Change the user the script run as by replacing `root` with the desired user.

5. Move the `log_broadcast.service` file to the systemd services directory:

   ```shell
   sudo mv log_broadcast.service /etc/systemd/system/
   ```

6. Reload the systemd daemon:

   ```shell
   sudo systemctl daemon-reload
   ```

7. Start the log broadcast service:

   ```shell
   sudo systemctl start log_broadcast.service
   ```

   You can also enable the service to start automatically on boot:

   ```shell
   sudo systemctl enable log_broadcast.service
   ```

8. Check the status of the service:

   ```shell
   sudo systemctl status log_broadcast.service
   ```

   If everything is set up correctly, you should see the service running without any errors.

## License

This project is licensed under the GNU Affero General Public License v3.0 (AGPLv3). This license requires that any modifications to the code must also be made available under the same license, even when the software is run as a service (e.g., over a network). See the [LICENSE](LICENSE) file for details.

## Contributing

If you find any issues or have suggestions for improvements, please open an issue or submit a pull request. Your contributions are greatly appreciated.