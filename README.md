# dotfiles

![desktop](https://github.com/sigfriedCub1990/dotfiles_reloaded/assets/8824202/0a322d9a-7906-481e-8a7b-8366ace43d57)

![image](https://github.com/sigfriedCub1990/dotfiles_reloaded/assets/8824202/aff58d4d-a9b8-4dfa-bff6-feb0dd189420)

These are my personal configurations for the systems I use, primarily Arch, and MacOS at work.


## How to use these dotfiles

1. Install [chezmoi](https://www.chezmoi.io/install/)
2. Execute the command `chezmoi init sigfriedcub1990/dotfiles_reloaded`
3. After the repository is clone, go to `~/.local/share/chezmoi` and create a file named `.chezmoidata.toml` with the following values:
    ```toml
    name = "Your name"
    email = "your@email.com"
    ```
    Those values will be used to setup Git's configuration.
4. Profit?
