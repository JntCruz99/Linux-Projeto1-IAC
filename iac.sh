#!/bin/bash

echo "Criando diretórios..."
mkdir -p /publico
mkdir -p /adm
mkdir -p /ven
mkdir -p /sec

echo "Criando grupos de usuários..."
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Criando usuários..."
useradd carlos -m -s /bin/bash -G GRP_ADM
useradd maria -m -s /bin/bash -G GRP_ADM
useradd joao -m -s /bin/bash -G GRP_ADM

useradd debora -m -s /bin/bash -G GRP_VEN
useradd sebastiana -m -s /bin/bash -G GRP_VEN
useradd roberta -m -s /bin/bash -G GRP_VEN

useradd josefina -m -s /bin/bash -G GRP_SEC
useradd amanda -m -s /bin/bash -G GRP_SEC
useradd rogerio -m -s /bin/bash -G GRP_SEC

echo "Definindo senhas para os usuários..."
# Gere senhas criptografadas
senha_carlos=$(openssl passwd -crypt senha123)
senha_maria=$(openssl passwd -crypt senha123)
senha_joao=$(openssl passwd -crypt senha123)
senha_debora=$(openssl passwd -crypt senha123)
senha_sebastiana=$(openssl passwd -crypt senha123)
senha_roberta=$(openssl passwd -crypt senha123)
senha_josefina=$(openssl passwd -crypt senha123)
senha_amanda=$(openssl passwd -crypt senha123)
senha_rogerio=$(openssl passwd -crypt senha123)

# Defina as senhas criptografadas para os usuários
usermod -p "$senha_carlos" carlos
usermod -p "$senha_maria" maria
usermod -p "$senha_joao" joao
usermod -p "$senha_debora" debora
usermod -p "$senha_sebastiana" sebastiana
usermod -p "$senha_roberta" roberta
usermod -p "$senha_josefina" josefina
usermod -p "$senha_amanda" amanda
usermod -p "$senha_rogerio" rogerio

echo "Especificando permissões dos diretórios..."
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

echo "Fim..."
