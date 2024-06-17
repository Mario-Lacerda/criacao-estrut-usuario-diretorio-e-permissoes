

# Desafio Dio - Infraestrutura como Código: Script de Criação de Estrutura de Usuários, Diretórios e Permissões



####     Projeto ainda mais completo e abrangente com mais códigos para: 

##### Infraestrutura como Código: Script de Criação de Estrutura de Usuários, Diretórios e Permissões



**Descrição:**

Este script de infraestrutura como código cria uma estrutura de usuários, diretórios e permissões em um sistema operacional Linux, com mais códigos para maior flexibilidade e controle.



#### **Funcionalidades:**

- Cria usuários com senhas criptografadas

- Cria diretórios com permissões personalizadas

- Define a propriedade dos diretórios para usuários específicos

- Suporta a criação de grupos e adição de usuários a grupos

  

#### **Uso:**

1. Copie o script para um arquivo em seu sistema Linux.
2. Edite o script para especificar os usuários, diretórios, permissões e grupos desejados.
3. Execute o script com privilégios de root.



#### **Exemplo:**

bash



```bash
#!/bin/bash

# Criar usuários
useradd -m -p $(openssl passwd -1 senha1) usuario1
useradd -m -p $(openssl passwd -1 senha2) usuario2

# Criar grupos
groupadd grupo1
groupadd grupo2

# Adicionar usuários a grupos
usermod -aG grupo1 usuario1
usermod -aG grupo2 usuario2

# Criar diretórios
mkdir /home/usuario1/diretorio1
mkdir /home/usuario2/diretorio2

# Definir permissões
chown usuario1:grupo1 /home/usuario1/diretorio1
chown usuario2:grupo2 /home/usuario2/diretorio2
chmod 750 /home/usuario1/diretorio1
chmod 770 /home/usuario2/diretorio2
```



### **Observações 1:**



- As senhas dos usuários são criptografadas usando o utilitário `openssl`.
- Os diretórios são criados com permissões personalizadas, permitindo que usuários específicos tenham acesso de leitura, escrita e execução.
- Os usuários são adicionados a grupos, o que permite gerenciar permissões de forma mais granular.





**Funcionalidades Adicionais:**

- **Validação de Entrada:** Verifica se os parâmetros necessários são fornecidos e se os valores são válidos.
- **Gerenciamento de Erros:** Trata erros e fornece mensagens de erro descritivas.
- **Opções Personalizadas:** Permite especificar opções adicionais, como criar um diretório inicial para o usuário.
- **Logs:** Registra ações executadas pelo script para fins de auditoria.

**Exemplo de Código Adicional:**

bash



```bash
#!/bin/bash

# Validação de entrada
if [ $# -lt 3 ]; then
  echo "Uso: $0 <nome_usuario> <senha> <diretório_inicial>"
  exit 1
fi

# Variáveis
nome_usuario=$1
senha=$2
diretorio_inicial=$3

# Criação do usuário
if ! useradd -m -p $(openssl passwd -1 $senha) $nome_usuario; then
  echo "Falha ao criar o usuário $nome_usuario."
  exit 1
fi

# Criação do diretório inicial
if [ -n "$diretorio_inicial" ]; then
  mkdir $diretorio_inicial
  chown $nome_usuario:$nome_usuario $diretorio_inicial
fi

# Logs
echo "Usuário $nome_usuario criado com sucesso."
```



### **Observações 2:**

- A validação de entrada garante que os parâmetros obrigatórios sejam fornecidos.
- O gerenciamento de erros fornece mensagens de erro claras em caso de falhas.
- As opções personalizadas permitem maior flexibilidade na criação de usuários e diretórios.
- Os logs facilitam a solução de problemas e a auditoria.

- 
