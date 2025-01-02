
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
    echo "5) Manage ICMP (Ping)"
    echo "6) BitTorrent Blocker"
    echo "7) Exit"
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
    sudo iptables -A OUTPUT  -s 0/0 -d 102.0.0.0/8 -j DROP
    sudo ptables -A OUTPUT   -s 0/0 -d 102.0.0.0/8 -j DROP
    sudo iptables -A OUTPUT  -s 0/0 -d 185.166.104.4/16 -j DROP
    sudo iptables -A OUTPUT  -s 0/0 -d 185.0.0.0/8 -j DROP
    sudo iptables -A OUTPUT  -s 0/0 -d 184.0.0.0/8 -j DROP
    sudo iptables -A OUTPUT  -s 0/0 -d 185.0.0.0/8 -j DROP
    sudo iptables -A OUTPUT  -s 0/0 -d 216.0.0.0/8 -j DROP
    sudo iptables -A OUTPUT  -s 0/0 -d 188.0.0.0/8 -j DROP
    sudo iptables -A OUTPUT  -s 0/0 -d 173.0.0.0/8 -j DROP
    sudo iptables -A OUTPUT  -s 0/0 -d 172.0.0.0/8 -j DROP
    sudo iptables -A OUTPUT  -s 0/0 -d 157.0.0.0/8 -j DROP
    sudo iptables -A OUTPUT  -s 0/0 -d 149.0.0.0/8 -j DROP
    sudo iptables -A OUTPUT  -s 0/0 -d 151.0.0.0/8 -j DROP
    sudo iptables -A OUTPUT  -s 0/0 -d 142.0.0.0/8 -j DROP
    sudo iptables -A OUTPUT  -s 0/0 -d 138.0.0.0/8 -j DROP
    sudo iptables -A OUTPUT  -s 0/0 -d 130.0.0.0/8 -j DROP
    sudo iptables -A OUTPUT  -s 0/0 -d 114.0.0.0/8 -j DROP
    sudo iptables -A OUTPUT  -s 0/0 -d 108.0.0.0/8 -j DROP
    iptables -A OUTPUT  -s 0/0 -d 104.0.0.0/10 -j DROP
    iptables -A OUTPUT  -s 0/0 -d 95.0.0.0/10 -j DROP
    iptables -A OUTPUT  -s 0/0 -d 94.0.0.0/10 -j DROP
    iptables -A OUTPUT  -s 0/0 -d 91.0.0.0/8 -j DROP
    iptables -A OUTPUT  -s 0/0 -d 86.0.0.0/8 -j DROP
    iptables -A OUTPUT  -s 0/0 -d 79.0.0.0/8 -j DROP
    iptables -A OUTPUT  -s 0/0 -d 74.0.0.0/8 -j DROP
    iptables -A OUTPUT  -s 0/0 -d 71.0.0.0/8 -j DROP
    iptables -A OUTPUT  -s 0/0 -d 66.0.0.0/8 -j DROP
    iptables -A OUTPUT  -s 0/0 -d 64.0.0.0/8 -j DROP
    iptables -A OUTPUT  -s 0/0 -d 54.0.0.0/8 -j DROP
    iptables -A OUTPUT  -s 0/0 -d 48.0.0.0/8 -j DROP
    iptables -A OUTPUT  -s 0/0 -d 47.0.0.0/8 -j DROP
    iptables -A OUTPUT  -s 0/0 -d 46.0.0.0/8 -j DROP
    iptables -A OUTPUT  -s 0/0 -d 45.0.0.0/8 -j DROP
    iptables -A OUTPUT  -s 0/0 -d 44.0.0.0/8 -j DROP
    iptables -A OUTPUT  -s 0/0 -d 49.0.0.0/8 -j DROP
    iptables -A OUTPUT  -s 0/0 -d 35.0.0.0/8 -j DROP
    iptables -A OUTPUT  -s 0/0 -d 31.0.0.0/8 -j DROP
    iptables -A OUTPUT  -s 0/0 -d 23.0.0.0/8 -j DROP
    iptables -A OUTPUT  -s 0/0 -d 20.0.0.0/8 -j DROP
    iptables -A OUTPUT  -s 0/0 -d 18.0.0.0/8 -j DROP
    iptables -A OUTPUT  -s 0/0 -d 17.0.0.0/8 -j DROP
    iptables -A OUTPUT  -s 0/0 -d 16.0.0.0/8 -j DROP
    iptables -A OUTPUT  -s 0/0 -d 15.0.0.0/8 -j DROP
    iptables -A OUTPUT  -s 0/0 -d 13.0.0.0/8 -j DROP
    iptables -A OUTPUT  -s 0/0 -d 5.0.0.0/8 -j DROP
    iptables -A OUTPUT -s 0/0 -d 3.0.0.0/8 -j DROP
    iptables -A OUTPUT  -s 0/0 -d 2.0.0.0/8 -j DROP
    iptables -A OUTPUT  -s 0/0 -d 185.166.104.4/16 -j DROP
    iptables -A OUTPUT  -s 0/0 -d 16.0.0.0/8 -j DROP
    iptables -A OUTPUT  -s 0/0 -d 15.0.0.0/8 -j DROP
  iptables -A OUTPUT  -s 0/0 -d 5.0.0.0/8 -j DROP
 iptables -A OUTPUT  -s 0/0 -d 3.0.0.0/8 -j DRO
    sudo iptables -A INPUT -p tcp --dport 302 -j DROP
    sudo iptables -A INPUT -p tcp --dport 166 -j DROP
    sudo iptables -A INPUT -p tcp --dport 78 -j DROP
    sudo iptables -A INPUT -p udp --dport 302 -j DROP
    sudo iptables -A INPUT -p udp --dport 166 -j DROP
    sudo iptables -A INPUT -p udp --dport 78 -j DROP

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

# Manage ICMP (Ping)
function manage_icmp {
    echo "1) Disable Ping (Block ICMP)"
    echo "2) Enable Ping (Allow ICMP)"
    read -p "Choose an option: " icmp_choice
    case $icmp_choice in
        1)
            echo "Blocking ICMP (Ping)..."
            sudo iptables -A INPUT -p icmp --icmp-type echo-request -j DROP
            sudo iptables -A OUTPUT -p icmp --icmp-type echo-reply -j DROP
            echo "Ping has been disabled."
            ;;
        2)
            echo "Allowing ICMP (Ping)..."
            sudo iptables -D INPUT -p icmp --icmp-type echo-request -j DROP 2>/dev/null
            sudo iptables -D OUTPUT -p icmp --icmp-type echo-reply -j DROP 2>/dev/null
            echo "Ping has been enabled."
            ;;
        *)
            echo "Invalid choice. Returning to main menu."
            ;;
    esac
    echo "Press Enter to return to menu."
    read
}

# BitTorrent Blocker
function bittorrent_blocker {
    echo "Downloading and executing BitTorrent blocker script..."
    wget https://raw.githubusercontent.com/meysamsh1092/bit-blocker/main/bt.sh
    chmod +x bt.sh
    bash bt.sh
    echo "BitTorrent blocker script executed. Press Enter to return to menu."
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
        5) manage_icmp ;;
        6) bittorrent_blocker ;;
        7) exit ;;
        *) echo "Invalid choice, please try again." ;;
    esac
done
