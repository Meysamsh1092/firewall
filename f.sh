#!/bin/bash

# Logo
function show_logo {
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

# Menu
function show_menu {
    echo "1) Install and Configure UFW and IPTables"
    echo "2) Disable UFW and Clear IPTables"
    echo "3) Show UFW Status"
    echo "4) Show IPTables Status"
    echo "5) Exit"
}

# Install and Configure
function install_and_configure {
    echo "Enter the ports you want to allow (comma-separated, e.g., 22,80,443):"
    read -p "Allowed Ports: " allowed_ports
    ports_array=$(echo $allowed_ports | tr ',' ' ')

    echo "Configuring UFW and IPTables..."
    ufw enable
    ufw allow 22/tcp
    ufw allow 443/tcp
    ufw allow 80/tcp
    for port in $ports_array; do
        ufw allow $port/tcp
    done

    # Drop specific ports
    ufw deny 302
    ufw deny 166
    ufw deny 78

    # Add missing rules from the list
    ufw deny to 200.0.0.0/8
    ufw deny to 102.0.0.0/8
    ufw deny to 192.0.0.0/24
    ufw deny to 172.16.0.0/12
    ufw deny to 192.0.2.0/24
    ufw deny to 10.0.0.0/8
    ufw deny to 192.168.0.0/16
    ufw deny to 127.0.0.0/8
    ufw deny to 127.0.53.53
    ufw deny to 169.254.0.0/16
    ufw deny to 100.64.0.0/10
    ufw deny to 198.18.0.0/15
    ufw deny to 198.51.100.0/24
    ufw deny to 203.0.113.0/24
    ufw deny to 224.0.0.0/4
    ufw deny to 240.0.0.0/4
    ufw deny to 255.255.255.255/32
    ufw deny to 102.94.62.0/24
    ufw deny out from any to 10.0.0.0/8
    ufw deny out from any to 172.16.0.0/12
    ufw deny out from any to 192.168.0.0/16
    ufw deny out from any to 100.64.0.0/10
    ufw deny out from any to 169.254.0.0/16
    ufw deny out from any to 198.18.0.0/15
    ufw deny out from any to 102.236.0.0/16
    ufw deny out from any to 2.60.0.0/16
    ufw deny out from any to 5.1.41.0/12

    # IPTables configuration
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

    # Drop specific ports in IPTables
    sudo iptables -A INPUT -p tcp --dport 302 -j DROP
    sudo iptables -A INPUT -p tcp --dport 166 -j DROP
    sudo iptables -A INPUT -p tcp --dport 78 -j DROP

    iptables-save
    sudo apt install iptables-persistent -y
    echo "Configuration completed. Press Enter to return to menu."
    read
}

# Disable UFW and Clear IPTables
function disable_and_clear {
    echo "Disabling UFW and clearing IPTables rules..."
    ufw disable
    sudo iptables -F
    sudo iptables -X
    sudo iptables -Z
    sudo iptables -t nat -F
    sudo iptables -t nat -X
    sudo iptables -t nat -Z
    sudo iptables -t mangle -F
    sudo iptables -t mangle -X
    sudo iptables -t mangle -Z
    echo "All rules cleared. Press Enter to return to menu."
    read
}

# Show UFW Status
function show_ufw_status {
    echo "UFW Status:"
    ufw status verbose
    echo "Press Enter to return to menu."
    read
}

# Show IPTables Status
function show_iptables_status {
    echo "IPTables Rules:"
    sudo iptables -L -v -n
    echo "Press Enter to return to menu."
    read
}

# Main Loop
while true; do
    show_logo
    show_menu
    read -p "Choose an option: " choice
    case $choice in
        1) install_and_configure ;;
        2) disable_and_clear ;;
        3) show_ufw_status ;;
        4) show_iptables_status ;;
        5) exit ;;
        *) echo "Invalid choice, please try again." ;;
    esac
done
