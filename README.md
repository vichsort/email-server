# Email Sever
Trabalho avaliativo para a disciplina de Redes, onde teremos de desenvolver um servidor de e-mail que permita os usuarios que possam se intercomunicar. Os membros são Allan Pablo Faustino, Álvaro Afonso Schenatto, Gabriel Schumann, João Victor Solforoso Peruzzo, Maurício Reisdoefer Pereira, Rômulo Nilson Horn e Vitor Marcelo Mignoni.

## VM
O VPS é administrado por uma máquina virtual Ubuntu Desktop, que possui o pacote `net-tools` - que permite o comando `ifconfig`.
```bash
# Organizar melhor dps
sudo nano /etc/hosts
# no final do arquivo ->
127.0.0.2 mail.exemplo.local mail
sudo hostnamectl set-hostname mail.exemplo.local
hostnamectl
ping 127.0.0.2 
```
