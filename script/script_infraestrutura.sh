#!/bin/bash

echo "Script de Criação de Estruturas de Usuários, Diretórios e Permissões"

echo "Criando diretórios"

mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

echo "Criando grupos"

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Adicionando as pastas aos seus respectivos grupos"

chown root:GRP_ADM /adm/
chown root:GRP_VEN /ven/
chown root:GRP_SEC /sec/

echo "Alterando permissões dos diretórios"

chmod 777 /publico/
chmod 770 /adm/
chmod 770 /ven/
chmod 770 /sec/ 

echo "Criando usuários"

useradd carlos -c "Carlos" -m -s /bin/bash -p $(openssl passwd senha) -G GRP_ADM
useradd maria -c "Maria" -m -s /bin/bash -p $(openssl passwd senha) -G GRP_ADM
useradd joao -c "João" -m -s /bin/bash -p $(openssl passwd senha) -G GRP_ADM

useradd debora -c "Debora" -m -s /bin/bash -p $(openssl passwd senha) -G GRP_VEN
useradd sebastiana -c "Sebastiana" -m -s /bin/bash -p $(openssl passwd senha) -G GRP_VEN
useradd roberto -c "Roberto" -m -s /bin/bash -p $(openssl passwd senha) -G GRP_VEN

useradd josefina -c "Josefina" -m -s /bin/bash -p $(openssl passwd senha) -G GRP_SEC
useradd amanda -c "Amanda" -m -s /bin/bash -p $(openssl passwd senha) -G GRP_SEC
useradd rogerio -c "Rogerio" -m -s /bin/bash -p $(openssl passwd senha) -G GRP_SEC

echo "Script finalizado!"
