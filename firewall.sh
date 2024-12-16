#!/bin/bash

# Function to display the logo
show_logo() {
    clear
    echo -e "\e[1;31m#########################################################\e[0m"
    echo -e "\e[1;31m#                                                       #\e[0m"
    echo -e "\e[1;31m#                      ███╗   ███╗                      #\e[0m"
    echo -e "\e[1;31m#                      ████╗ ████║                      #\e[0m"
    echo -e "\e[1;31m#                      ██╔████╔██║                      #\e[0m"
    echo -e "\e[1;31m#                      ██║╚██╔╝██║                      #\e[0m"
    echo -e "\e[1;31m#                      ██║ ╚═╝ ██║                      #\e[0m"
    echo -e "\e[1;31m#                      ╚═╝     ╚═╝                      #\e[0m"
    echo -e "\e[1;31m#                                                       #\e[0m"
    echo -e "\e[1;31m#                   M E Y S A M S H 1 0 9 2             #\e[0m"
    echo -e "\e[1;31m#########################################################\e[0m"
    echo ""
}

# Function to display the menu
show_menu() {
    show_logo
    echo "1) Install Firewall Rules and Allow Ports"
    echo "2) Disable Firewall and Reset iptables"
    echo "3) Exit"
    echo ""
}

# Function to install firewall rules and allow user-defined ports
install_firewall() {
    show_logo
    echo "Installing firewall rules..."
    sudo ufw enable
    sudo ufw allow 22/tcp
    sudo ufw allow 443/tcp
    sudo ufw allow 80/tcp

    # Ask for user-defined ports
    echo "Enter the ports you want to allow (comma-separated, e.g., 8080,9090):"
    read ports
    IFS=',' read -r -a port_array <<< "$ports"
    for port in "${port_array[@]}"; do
        sudo ufw allow "$port/tcp"
    done

    # Add UFW deny rules
    sudo ufw deny out from any to 10.0.0.0/8
    sudo ufw deny out from any to 172.16.0.0/12
    sudo ufw deny out from any to 192.168.0.0/16
    sudo ufw deny out from any to 100.64.0.0/10
    sudo ufw deny out from any to 198.18.0.0/15
    sudo ufw deny out from any to 169.254.0.0/16
    sudo ufw deny out from any to 102.236.0.0/16
    sudo ufw deny out from any to 2.60.0.0/16
    sudo ufw deny out from any to 5.1.41.0/12

    # Add iptables rules
    sudo iptables -A FORWARD -s 200.0.0.0/8 -j DROP
    sudo iptables -A FORWARD -s 102.0.0.0/8 -j DROP
    sudo iptables -A FORWARD -s 10.0.0.0/8 -j DROP
    sudo iptables -A FORWARD -s 100.64.0.0/10 -j DROP
    sudo iptables -A FORWARD -s 169.254.0.0/16 -j DROP
    sudo iptables -A FORWARD -s 198.18.0.0/15 -j DROP
    sudo iptables -A FORWARD -s 198.51.100.0/24 -j DROP
    sudo iptables -A FORWARD -s 203.0.113.0/24 -j DROP
    sudo iptables -A FORWARD -s 224.0.0.0/4 -j DROP
    sudo iptables -A FORWARD -s 240.0.0.0/4 -j DROP
    sudo iptables -A FORWARD -s 255.255.255.255/32 -j DROP
    sudo iptables -A FORWARD -s 192.0.0.0/24 -j DROP
    sudo iptables -A FORWARD -s 192.0.2.0/24 -j DROP
    sudo iptables -A FORWARD -s 127.0.0.0/8 -j DROP
    sudo iptables -A FORWARD -s 127.0.53.53 -j DROP
    sudo iptables -A FORWARD -s 192.168.0.0/16 -j DROP
    sudo iptables -A FORWARD -s 0.0.0.0/8 -j DROP
    sudo iptables -A FORWARD -s 172.16.0.0/12 -j DROP
    sudo iptables -A FORWARD -s 224.0.0.0/3 -j DROP
    sudo iptables -A FORWARD -s 192.88.99.0/24 -j DROP
    sudo iptables -A FORWARD -s 169.254.0.0/16 -j DROP
    sudo iptables -A FORWARD -s 198.18.140.0/24 -j DROP
    sudo iptables -A FORWARD -s 102.230.9.0/24 -j DROP
    sudo iptables -A FORWARD -s 102.233.71.0/24 -j DROP
    sudo iptables -A OUTPUT -p udp -s 0/0 -d 102.0.0.0/8 -j DROP
    sudo ptables -A OUTPUT -p tcp -s 0/0 -d 102.0.0.0/8 -j DROP
    sudo iptables -A OUTPUT -p udp -s 0/0 -d 185.166.104.4/16 -j DROP
    sudo iptables -A OUTPUT -p udp -s 0/0 -d 185.0.0.0/8 -j DROP
    sudo iptables -A OUTPUT -p udp -s 0/0 -d 184.0.0.0/8 -j DROP
    sudo iptables -A OUTPUT -p udp -s 0/0 -d 185.0.0.0/8 -j DROP
    sudo iptables -A OUTPUT -p udp -s 0/0 -d 216.0.0.0/8 -j DROP
    sudo iptables -A OUTPUT -p udp -s 0/0 -d 188.0.0.0/8 -j DROP
    sudo iptables -A OUTPUT -p udp -s 0/0 -d 173.0.0.0/8 -j DROP
    sudo iptables -A OUTPUT -p udp -s 0/0 -d 172.0.0.0/8 -j DROP
    sudo iptables -A OUTPUT -p udp -s 0/0 -d 157.0.0.0/8 -j DROP
    sudo iptables -A OUTPUT -p udp -s 0/0 -d 149.0.0.0/8 -j DROP
    sudo iptables -A OUTPUT -p udp -s 0/0 -d 151.0.0.0/8 -j DROP
    sudo iptables -A OUTPUT -p udp -s 0/0 -d 142.0.0.0/8 -j DROP
    sudo iptables -A OUTPUT -p udp -s 0/0 -d 138.0.0.0/8 -j DROP
    sudo iptables -A OUTPUT -p udp -s 0/0 -d 130.0.0.0/8 -j DROP
    sudo iptables -A OUTPUT -p udp -s 0/0 -d 114.0.0.0/8 -j DROP
    sudo iptables -A OUTPUT -p udp -s 0/0 -d 108.0.0.0/8 -j DROP
    iptables -A OUTPUT -p udp -s 0/0 -d 104.0.0.0/10 -j DROP
    iptables -A OUTPUT -p udp -s 0/0 -d 95.0.0.0/10 -j DROP
    iptables -A OUTPUT -p udp -s 0/0 -d 94.0.0.0/10 -j DROP
    iptables -A OUTPUT -p udp -s 0/0 -d 91.0.0.0/8 -j DROP
    iptables -A OUTPUT -p udp -s 0/0 -d 86.0.0.0/8 -j DROP
    iptables -A OUTPUT -p udp -s 0/0 -d 79.0.0.0/8 -j DROP
    iptables -A OUTPUT -p udp -s 0/0 -d 74.0.0.0/8 -j DROP
    iptables -A OUTPUT -p udp -s 0/0 -d 71.0.0.0/8 -j DROP
    iptables -A OUTPUT -p udp -s 0/0 -d 66.0.0.0/8 -j DROP
    iptables -A OUTPUT -p udp -s 0/0 -d 64.0.0.0/8 -j DROP
    iptables -A OUTPUT -p udp -s 0/0 -d 54.0.0.0/8 -j DROP
    iptables -A OUTPUT -p udp -s 0/0 -d 48.0.0.0/8 -j DROP
    iptables -A OUTPUT -p udp -s 0/0 -d 47.0.0.0/8 -j DROP
    iptables -A OUTPUT -p udp -s 0/0 -d 46.0.0.0/8 -j DROP
    iptables -A OUTPUT -p udp -s 0/0 -d 45.0.0.0/8 -j DROP
    iptables -A OUTPUT -p udp -s 0/0 -d 44.0.0.0/8 -j DROP
    iptables -A OUTPUT -p udp -s 0/0 -d 49.0.0.0/8 -j DROP
    iptables -A OUTPUT -p udp -s 0/0 -d 35.0.0.0/8 -j DROP
    iptables -A OUTPUT -p udp -s 0/0 -d 31.0.0.0/8 -j DROP
    iptables -A OUTPUT -p udp -s 0/0 -d 23.0.0.0/8 -j DROP
    iptables -A OUTPUT -p udp -s 0/0 -d 20.0.0.0/8 -j DROP
    iptables -A OUTPUT -p udp -s 0/0 -d 18.0.0.0/8 -j DROP
    iptables -A OUTPUT -p udp -s 0/0 -d 17.0.0.0/8 -j DROP
    iptables -A OUTPUT -p udp -s 0/0 -d 16.0.0.0/8 -j DROP
    iptables -A OUTPUT -p udp -s 0/0 -d 15.0.0.0/8 -j DROP
    iptables -A OUTPUT -p udp -s 0/0 -d 13.0.0.0/8 -j DROP
    iptables -A OUTPUT -p udp -s 0/0 -d 5.0.0.0/8 -j DROP
    iptables -A OUTPUT -p udp -s 0/0 -d 3.0.0.0/8 -j DROP
    iptables -A OUTPUT -p udp -s 0/0 -d 2.0.0.0/8 -j DROP
    iptables -A OUTPUT -p  tcp -s 0/0 -d 185.166.104.4/16 -j DROP
    iptables -A OUTPUT -p  tcp -s 0/0 -d 16.0.0.0/10 -j DROP
    iptables -A OUTPUT -p  tcp -s 0/0 -d 15.0.0.0/10 -j DROP
  iptables -A OUTPUT -p  tcp -s 0/0 -d 5.0.0.0/10 -j DROP
 iptables -A OUTPUT -p  tcp -s 0/0 -d 3.0.0.0/10 -j DROP
   iptables -A OUTPUT -p  tcp -s 0/0 -d 185.166.104.4/16 -j DROP
    sudo iptables-save

    sudo apt install iptables-persistent -y
    echo "Firewall rules and ports setup completed!"
    read -p "Press Enter to return to the main menu..."
}

# Function to disable firewall and reset iptables
disable_firewall() {
    show_logo
    echo "Disabling firewall and resetting iptables..."

    # Disable ufw
    sudo ufw disable

    # Flush iptables
    sudo iptables -F
    sudo iptables -X
    sudo iptables -t nat -F
    sudo iptables -t nat -X
    sudo iptables -t mangle -F
    sudo iptables -t mangle -X
    sudo iptables -P INPUT ACCEPT
    sudo iptables -P FORWARD ACCEPT
    sudo iptables -P OUTPUT ACCEPT

    echo "Firewall and iptables have been reset!"
    read -p "Press Enter to return to the main menu..."
}

# Main script loop
while true; do
    show_menu
    read -p "Choose an option (1-3): " choice
    case $choice in
        1)
            install_firewall
            ;;
        2)
            disable_firewall
            ;;
        3)
            echo "Exiting. Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            read -p "Press Enter to continue..."
            ;;
    esac
done
