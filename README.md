# Email Sever

Trabalho avaliativo para a disciplina de Redes, onde teremos de desenvolver um servidor de e-mail que permita os usuarios que possam se intercomunicar. Os membros são Allan Pablo Faustino, Álvaro Afonso Schenatto, Gabriel Schumann, João Victor Solforoso Peruzzo, Maurício Reisdoefer Pereira, Rômulo Nilson Horn e Vitor Marcelo Mignoni. <br>
Para este trabalho, o domínio gsvm.com.br foi adquirido para servir como âncora do serviço de e-mail. Ao mesmo tempo, foram-se usados os serviços da Amazon Web Services como host dos serviços.

---

## Configurações iniciais

1. A placa não pode estar em modo NAT. Coloque-a para `placa em modo bridge` que deve ter o nome similar a "Intel(R) Ethernet Connection" 
2. Então, garanta que seu sistema está devidamente atualizado
```bash
sudo apt update && sudo apt upgrade -y
```
3. Agora, defina um hostname (nome acessório ao seu IP) para seu sistema
```bash
sudo hostnamectl set-hostname mail.{seudominio}.local
# Exemplo: mail.gsvm.local
```
4. Descubra seu IP
```bash
ifconfig # caso não tenha, instale net-tools
```
5. Este IP que você descobriu será usado agora: vamos modificar o `/etc/hosts`
```bash
sudo nano /etc/hosts
```
6. Adicione uma linha, logo abaixo do host que você já possui, dizendo seu host novo baseado em seu IP
```ini
192.0.0.1  localhost
{seu ip}  mail.{seudominio}.local
# Exemplo: 10.0.2.15  mail.gsvm.local
```
7. Instale o postfix, responsável por enviar os e-mails:
```bash
sudo apt install postfix -y
```
Durante a configuração, escolha "Internet Site", e em nome do correio insira {seudominio}.local (como gsvm.local)
8. Então, insira os dados do postfix para que ele saiba a direção e caminhos a seguir 
