# 7* buscar por atualizaçoes no sistema operacional:

apt-get update -y && apt-get upgrade -y

# 8* fazer a instalaçao do samba 

apt-get install -y samba krb5-config winbind smbclient

# 9* criar um backup do smb.conf:

mv /etc/samba/smb.conf 

# 10* configurar o dominio com o comando: 

samba-tool domain provision

# 11* copiar o arquivo  krb5.conf

cp var/lib/samba/private/krb5.conf /etc/

# 12* parar os servicos do samba:

systemctl stop smbd nmbd winbind

# 13* desabilitar da inicualizacao

systemctl disable smbd nmbd winbind

# 14* renomear os servicos de samba-ad-dc

systemctl unmask samba-ad-dc

# 15* subir o novo servico

systemctl start samba-ad-dc

# 16* habilitar o novo servico na inicializacao do sistema

systemctl enable samba-ad-dc
