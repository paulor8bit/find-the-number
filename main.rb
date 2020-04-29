def boas_vindas
	puts
    puts "        P  /_\  P                              "
    puts "       /_\_|_|_/_\                             "
    puts "   n_n | ||. .|| | n_n         Bem vindo ao    "
    puts "   |_|_|nnnn nnnn|_|_|     Jogo de Adivinhação!"
    puts "  |' '  |  |_|  |'  ' |                        "
    puts "  |_____| ' _ ' |_____|                        " 
    puts "        \__|_|__/                              "
    puts
    puts "Qual é o seu nome?"
    nome = gets.strip
    puts "\n\n\n\n\n\n"
    puts "Começaremos o jogo para você, #{nome}"
	nome #manda nome para fora do def
end

def pede_dificuldade
puts "Qual o nivel de dificuldade? 1: Facil, 2: Quase Facil, 3: Medio, 4: Dificil a 5: Super Dificil"
dificuldade = gets.to_i
end

def sorteia_numero_secreto (dificuldade) #sorteado sai do  def sorteando_numero
	case dificuldade #caso dificuldade tenha valor 1 a 5
	when 1 
		maximo = 10
	when 2
		maximo = 30
	when 3 
		maximo = 100
	when 4
		maximo = 150
	else
		maximo = 200
	end
	puts "Escolhendo um número secreto entre 1 e #{maximo}..."
	sorteado = rand(maximo) + 1 #faz sortear numero de 1 a 200
	puts "Escolhido... que tal adivinhar hoje nosso número secreto?"
	sorteado #manda para script principal
	#numero acima para sair do def
end


def pede_um_numero (chutes, tentativa, limite_de_tentativas) #tentativa, limite e chutes entra e chute sai do pede_um_numero
	puts "\n\n\n\n\n\n"
	puts "Tentativa #{tentativa} de #{limite_de_tentativas}"
	puts "Chutes até agora: #{chutes}"#impressao do array porem esta com erro
	puts "Entre com um numero"
	chute = gets.strip
	puts "Sera que você acertou?" + chute
	chute # manda para script principal
end


def verifica_se_acertou (numero_secreto, chute)
	acertou = numero_secreto == chute.to_i
	
	if acertou 
		ganhou
		return true #Se acertou ja sai deste DEF	
	end 
	maior = numero_secreto > chute.to_i
	if maior
			puts "o numero é maior"
		else
			puts "O numero é menor"
	end
	false #aqui também é um return false
end

def ganhou
	puts
    puts "             OOOOOOOOOOO               "
    puts "         OOOOOOOOOOOOOOOOOOO           "
    puts "      OOOOOO  OOOOOOOOO  OOOOOO        "
    puts "    OOOOOO      OOOOO      OOOOOO      "
    puts "  OOOOOOOO  #   OOOOO  #   OOOOOOOO    "
    puts " OOOOOOOOOO    OOOOOOO    OOOOOOOOOO   "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOO  OOOOOOOOOOOOOOOOOOOOOOOOO  OOOO  "
    puts " OOOO  OOOOOOOOOOOOOOOOOOOOOOO  OOOO   "
    puts "  OOOO   OOOOOOOOOOOOOOOOOOOO  OOOO    "
    puts "    OOOOO   OOOOOOOOOOOOOOO   OOOO     "
    puts "      OOOOOO   OOOOOOOOO   OOOOOO      "
    puts "         OOOOOO         OOOOOO         "
    puts "             OOOOOOOOOOOO              "
    puts
    puts "               Acertou!                "
    puts
end

def joga (nome, dificuldade)
	numero_secreto = sorteia_numero_secreto dificuldade

	pontos_ate_agora = 1000 	
	limite_de_tentativas = 5
	chutes = [] #array


	for tentativa in 1..limite_de_tentativas
		chute = pede_um_numero chutes, tentativa, limite_de_tentativas #Pegar e mandar dados do Def pede_um_numero
		chutes << chute # Contador para o array e size para ver o tamanho da array
		#total_de_chutes += 1 # Contador para o array total_de_chutes = total_de_chutes + 1
		pontos_a_perder = (chute.to_i - numero_secreto.to_i).abs / 2.0 # .abs transforma em numero positivo ou usar if abaixo
			#if pontos_a_perder < 0 
			#	pontos_a_perder = (pontos_a_perder * (-1))
			#end	
			pontos_ate_agora -= pontos_a_perder #é igual a pontos_ate_agora = pontos_ate_agora - pontos_a_perder 
		
		if verifica_se_acertou numero_secreto, chute
		break
		end
end	

puts "Você ganhou #{pontos_ate_agora} de pontos"
puts "O numero certo era: #{numero_secreto} "

end

def nao_quer_jogar?
    puts "Deseja jogar novamente? (S/N)"
    quero_jogar = gets.strip
    nao_quero_jogar = quero_jogar.upcase == "N" #upcase deixa o sempre em maiusculo
end

nome = boas_vindas
dificuldade = pede_dificuldade

loop do
    joga nome, dificuldade
    break if nao_quer_jogar?
end

