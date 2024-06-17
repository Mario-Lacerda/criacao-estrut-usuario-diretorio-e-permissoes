#!/bin/bash

# Lista de grupos e usuários para cada grupo
group_users=(
  "GRP_ADM carlos maria joao"
  "GRP_VEN debora sebastiana roberto"
  "GRP_SEC josefina amanda rogerio"
)

# Senha comum para todos os usuários
common_password="91212916"

# Loop para criar grupos e usuários
for group_user in "${group_users[@]}"; do
  group="${group_user%% *}"
  users="${group_user#* }"

  echo "Criando grupo $group..."
  sudo groupadd "$group"

  echo "Criando usuários do grupo $group..."
  for user in $users; do
    echo "Criando usuário $user..."
    sudo useradd -m -G "$group" "$user"
    echo "$user:$common_password" | sudo chpasswd
    echo "Forçando troca de senha para $user no próximo login..."
    sudo passwd -e "$user"
  done
done

# Definir permissões e proprietários dos diretórios
echo "Definindo permissões e proprietários..."
sudo mkdir /publico
sudo mkdir /adm
sudo mkdir /ven
sudo mkdir /sec

sudo chown root:root /publico
sudo chown root:root /adm
sudo chown root:root /ven
sudo chown root:root /sec

sudo chmod 777 /publico
sudo chmod 770 /adm
sudo chmod 770 /ven
sudo chmod 770 /sec

sudo chown :GRP_ADM /adm
sudo chown :GRP_VEN /ven
sudo chown :GRP_SEC /sec

echo "Configuração concluída!"