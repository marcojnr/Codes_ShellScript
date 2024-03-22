#!bin/bash

############################################################################################
#	EXERCICIO DESENVOLVIDO NO CURSO DE SHELL SCRIPT - UDEMY				   #	
#											   #
#   Nome do arquivo: Tamanho_arquivo.sh 						   #
# 											   #
#   Prof: Ricardo Prudenciado								   #
#   Aluno: Marco Batista								   #
#											   #
#   Descrição: Baseado em informação do usuário, o script criar um arquivo texto de 	   #
#   determinado tamanho.								   #
############################################################################################


read -p "Informe o nome do arquivo a ser criado: " NOME
read -p "Informe um conjunto de caracteres: " PALAVRA
read -p "Informe o tamanho final do arquivo (em bytes): " TAMANHO

cat /dev/null > $NOME #remover tudo que tem no arquico caso exista

PORC_EXIBIDA=0

until [ $TAMANHO -le $(stat --printf=%s "$NOME") ] #tamanho_final <= tamanho_atual
do
	echo -n $PALAVRA >> $NOME
	TAMANHO_ATUAL=$(stat --printf=%s "$NOME")

	PORC_ATUAL=$(expr $TAMANHO_ATUAL \* 100 / $TAMANHO)
	
	
	if [ $(expr $PORC_ATUAL % 10) -eq 0 -a $PORC_EXIBIDA -ne $PORC_ATUAL ]
	then
		echo "Concluido: $PORC_ATUAL% - Tamanho do Arquivo: $TAMANHO_ATUAL"
		PORC_EXIBIDA=$PORC_ATUAL
	fi
	
done



