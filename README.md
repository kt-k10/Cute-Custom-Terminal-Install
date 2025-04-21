## Custom terminal setup install✨
A shell script that customizes your terminal setup by adding:

- Useful aliases

- A terminal greeting with ASCII art

- Optional support for tools like cowsay

This script works with both Bash and Zsh. It also creates a backup of your original shell config file before making changes.

1. Clone this repository and cd into it

2. Run the installer:
   
   ```./install.sh```

If you try to run the install.sh script but get an execution permissions error, run the following command to make the script executable:


   ```chmod +x install.sh```

Now, you can run the script with:

   ```./install.sh```


4. Restart your terminal, or reload your config:

   ```source ~/.bashrc```

or

   ```source ~/.zshrc```


## Notes
This script automatically backs up your original .bashrc or .zshrc as .bashrc.backup or .zshrc.backup.

You can edit the ascii_art.txt and aliases.sh files to customize your setup before running the script.

