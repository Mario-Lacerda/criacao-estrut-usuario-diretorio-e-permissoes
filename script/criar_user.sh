#!/bin/bash

echo "Criando usuários do sistema...."

useradd guest10 -c "Usuario convidado" -s /bin/bash -m -p $(openssl passwd senha)
passwd guest10 -e

useradd guest11 -c "Usuario convidado" -s /bin/bash -m -p $(openssl passwd senha)
passwd guest11 -e

useradd guest12 -c "Usuario convidado" -s /bin/bash -m -p $(openssl passwd senha)
passwd guest12 -e

useradd guest13 -c "Usuario convidado" -s /bin/bash -m -p $(openssl passwd senha)
passwd guest13 -e

echo "Finalizado!!"


