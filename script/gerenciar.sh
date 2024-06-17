#!/bin/bash

echo "Criando diretorios ..."

mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

echo "Diretorios Criados !"
echo "Criando grupos ..."

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Grupos Criados!"
echo "Criando Usuarios ..."

useradd carlos -c "Carlos Henrique" -m -s /bin/bash -p $(openssl passwd senha123)
passwd carlos -e
useradd maria -c "Maria de Jesus" -m -s /bin/bash -p $(openssl passwd senha123)
passwd maria -e
useradd joao -c "Joao Carlos De Jesus" -m -s /bin/bash -p $(openssl passwd senha123)
passwd joao -e

useradd debora -c "Debora Nunes Campos" -m -s /bin/bash -p $(openssl passwd senha123)
passwd debora -e
useradd sebastiana -c "Sebastiana Silva" -m -s /bin/bash -p $(openssl passwd senha123)
passwd sebastiana -e
useradd roberto -c "Roberto Rodrigues" -m -s /bin/bash -p $(openssl passwd senha123)
passwd roberto -e

useradd josefina -c "Josefina de Jesus" -m -s /bin/bash -p $(openssl passwd senha123)
passwd josefina -e
useradd amanda -c "Amanda Nunes" -m -s /bin/bash -p $(openssl passwd senha123)
passwd amanda -e
useradd rogerio -c "Rogerio do Mangue" -m -s /bin/bash -p $(openssl passwd senha123)
passwd rogerio -e

echo "Usuarios Criados!"
echo "Adicionando usuarios aos grupos ..."

usermod -G GRP_ADM carlos 
usermod -G GRP_ADM maria
usermod -G GRP_ADM joao

usermod -G GRP_VEN debora
usermod -G GRP_VEN sebastiana
usermod -G GRP_VEN roberto

usermod -G GRP_SEC josefina
usermod -G GRP_SEC amanda
usermod -G GRP_SEC rogerio

echo "Usuarios adicionados aos grupos"

chown root:GRP_ADM /adm/
chown root:GRP_VEN /ven/
chown root:GRP_SEC /sec/

chmod 777 /publico/
chmod 770 /adm/
chmod 770 /ven/
chmod 770 /sec/

echo "Permissões atualizadas"