# Logfile to Discord

This repository contains a simple shell script and systemd service files that allow you to broadcast log messages to a Discord channel using a webhook. 

This can be useful for monitoring and receiving notifications about specific events or errors in your log files.

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

## Contributing

If you find any issues or have suggestions for improvements, please open an issue or submit a pull request. Your contributions are greatly appreciated.