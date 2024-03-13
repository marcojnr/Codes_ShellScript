#!/bin/bash

# MENU DE OPERAÇÕES

read -p "Informe o valor 1: " Valor1
read -p "Informe o valor 2: " Valor2
echo -e "\n"

if [ ! $Valor1 ] || [ ! $Valor2 ]
then
	echo "Nenhum dos valores pode ser nulo"
	exit 1
fi

echo "Escolha uma das Operações: "
echo "1 = Soma"
echo "2 = Subtração"
echo "3 = Multiplicação"
echo "4 = Divisão"
echo -e "Q = Sair\n"

read -p "opção: " opcao
echo -e "\n"

case "$opcao" in 
	1)
		oper="+"
		#echo "--- Soma ----"
		#echo $Valor1 + "+" + $valor2 + "=" + $Valor1+$Valor2
		;;
	2)
		oper="-"
		;;
	3)
		if [ $Valor1 -eq 0 -o $Valor2 -eq 0 ]  # -o igual || (ou)
		then
			echo "Um valor 0 não pode ser utilizado em um multiplicação"
			exit 1
		fi
		oper="*"
		;;
	4)
		if [ $Valor -eq 0 -o $Valor2 -eq 0 ]
		then
			echo "Um valor 0 não pode ser utilizado em uma divisão"
			exit 1
		fi

		if [ $(expr $Valor1 % $Valor2) -ne 0 ]
		then
			echo "Divisão com Resto = $(expr $Valor1 % $Valor2)"
		else
			echo "Divisão exata"
		fi
		echo
		oper="/"
		;;
	[Qq])
		echo "Saindo..."
		exit
		;;
	*)
		echo "Opção Inválida"
		exit 1
		;;
	esac
	echo "$Valor1 $oper $Valor2 = $(expr $Valor1 "$oper" $Valor2)"

