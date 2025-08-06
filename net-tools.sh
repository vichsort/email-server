function config_net_tools(){
    # Download do net-tools
    echo 'Installing net-tools'
    sudo apt install net-tools

    # Abre o arquivo /etc/hosts para edição manual
    echo 'Abrindo /etc/hosts...'
    sudo nano /etc/hosts
    echo "# Adicione ao final do arquivo:"
    echo "127.0.0.2 mail.exemplo.local mail"

    # Define hostname
    echo 'Choose hostname: '
    read -p "Digite o novo hostname (ex: mail.exemplo.local): " hostname
    sudo hostnamectl set-hostname $hostname
    hostnamectl
}