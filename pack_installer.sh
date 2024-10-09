#!/bin/bash

prompt_install() {
    # Update repository
    echo "Update Repository for Pacman? (y/n)"
    read out

    if [[ "$out" == "y" || "$out" == "Y" ]]; then
        sudo pacman -Sy --noconfirm

        read -p "Update System With Packages for Pacman? (y/n)  " ch

             if [[ "$ch" == "y" || "$ch" == "y" ]]; then

                  echo"Updating System Now.."
                  sudo pacman -Syu --noconfirm



    elif [[ "$out" == "n" || "$out" == "N" ]]; then
        # Update system packages
        
        read -p "UPDATE THE REPOSITORY BEFORE UPGRADING THE SYSTEM RECOMMENDED!!! Update Repo now? (Y/n)" ch
        if [["$ch" == "y" || $ch == "Y"]]; then

            prompt_install

        read -p "Update System With Packages for Pacman? (y/n)  " ch

     
        else
            exit
        fi
    else 
        exit
    fi

    # List of required packages
    packages=("discord" "wine" "lutris" "bottles" "firefox" "goverlay" "mangohud" "steam" "telegram-desktop" "element-desktop" "yay")

    echo -e "Get Ready, Going to install these packages from pacman:\n${packages[@]}"

    read -p "Do you wish to continue (y/n)? " choice

    if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
        pacman_app_install() {
            for package in "${packages[@]}"; do
                sudo pacman -S "$package" --noconfirm 
            done
        }
        pacman_app_install  # Call the function to install packages

    elif [[ "$choice" == "n" || "$choice" == "N" ]]; then
        echo "Skipping Pacman Installation..."
    else
        echo "Wrong Option Exiting..."
        exit
    fi

    echo -e "Get Ready, Going to install these packages from yay (AUR helper):\n${packages[@]}"

    read -p "Do you wish to continue (y/n)? " choice

    if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
        yay_pack=("vscodium-bin" "spotube-bin")

        yay_app_install() {
            for package in "${yay_pack[@]}"; do
                yay -S "$package" --noconfirm
            done
        }
        yay_app_install  # Call the function to install yay packages

    elif [[ "$choice" == "n" || "$choice" == "N" ]]; then
        echo "Skipping yay Installation..."
    else
        echo "Wrong Option Exiting..."
        exit
    fi
}

# Call the function
prompt_install
#ddd