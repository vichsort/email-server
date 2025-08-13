# Email Sever

Trabalho avaliativo para a disciplina de Redes, onde teremos de desenvolver um servidor de e-mail que permita os usuarios que possam se intercomunicar. Os membros são Allan Pablo Faustino, Álvaro Afonso Schenatto, Gabriel Schumann, João Victor Solforoso Peruzzo, Maurício Reisdoefer Pereira, Rômulo Nilson Horn e Vitor Marcelo Mignoni. <br>
Para este trabalho, o domínio gsvm.com.br foi adquirido para servir como âncora do serviço de e-mail. Ao mesmo tempo, foram-se usados os serviços da Amazon Web Services como host dos serviços.

---

## Configurações iniciais

A placa não pode estar em modo NAT. Coloque-a para `placa em modo bridge` com o nome "Intel(R) Ethernet Connection"

```bash
sudo apt update
sudo apt install postfix dovecot-core dovecot-imapd dovecot-pop3d dovecot-lmtpd -y
```

- Tipo de configuração: Internet Site
- Nome do sistema de correio: gsvm.com.br

```bash
sudo nano /etc/postfix/main.cf
```

o que modificar:

```ini
myhostname = mail.gsvm.com.br
myorigin = /etc/mailname
mydestination = $myhostname, gsvm.com.br, localhost.localdomain, localhost
home_mailbox = Maildir/
smtpd_tls_cert_file=/etc/letsencrypt/live/mail.gsvm.com.br/fullchain.pem
smtpd_tls_key_file=/etc/letsencrypt/live/mail.gsvm.com.br/privkey.pem
smtpd_use_tls=yes
```

salvar e reiniciar
```bash
sudo systemctl restart postfix
```

```bash
sudo nano /etc/dovecot/conf.d/10-mail.conf
```
editar
```ini
mail_location = maildir:~/Maildir
```

```bash
sudo nano /etc/dovecot/conf.d/10-auth.conf
```
edite
```ini
disable_plaintext_auth = no
auth_mechanisms = plain login
```
salve e reinicie
```
sudo systemctl restart dovecot
```
crie um usuário
```bash
sudo adduser vitor
# ou crie outro usuário desejado

# Agora crie a estrutura Maildir:
sudo su - vitor
mkdir -p Maildir/{cur,new,tmp}
exit
```
