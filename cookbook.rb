#Cria variaveis globais para a acao no menu
INSERIR_RECEITAS = 1
VER_RECEITAS = 2
BUSCAR_RECEITAS = 3
SAIR = 4

#metodo para menssagem de boas vindas
def bem_vindo
  puts
  puts "Bem vindo ao cookbook, sua rede social de receitas"
  puts
end

#metodo para adiciona menu
def menu
  puts "[#{INSERIR_RECEITAS}] Para cadastra uma receita"
  puts "[#{VER_RECEITAS}] Ver as receitas cadastradas"
  puts "[#{BUSCAR_RECEITAS}] Buscar receitas"
  puts "[#{SAIR}] Sair"
  puts
  print "Escolha uma opcao: "
  return gets.to_i() #retorna o valor digitado pelo usuario
end

#metodo para adicionar receita
def adicior_receita
  puts "Digite o nome da receita"
  nome = gets.chomp()
  puts "Digite o tipo da receita"
  tipo = gets.chop()

  puts
  puts "Receita #{nome} do tipo #{tipo} cadastrada com sucesso!!"
  puts
  return {nome: nome, tipo: tipo} #retorna o nome e o tipo digitado pelo usuario
end

#metodo para mostra receitas cadastradas
def mostra_receita(receitas)
  puts
  puts "===== RECEITA CADASTRADAS ====="
  receitas.each do |receita|
  puts "#{receita[:nome]} - #{receita[:tipo]}"
  end
  puts
  if receitas.empty? #verifica se o array esta vasio
    puts "Nao tem receitas cadastradas"
  end
end

#metodo para pesquisar receitas cadastradas
def cria_busca(receitas)
  busca = gets.chomp()
    #cria array somente com os elementos correspondente a busca
    resultados_nome = receitas.find_all { |receita| receita[:nome] == busca }
    resultados_tipo = receitas.find_all { |receita| receita[:tipo] == busca }
    #se tiver o elemento no array execute isso
    if resultados_nome.any?
      puts
      puts "Itens cadastrados buscando pelo nome"
      puts
      resultados_nome.each do |receita|
        puts "#{receita[:nome]} - #{receita[:tipo]}"
        puts
      end
    #se tiver o elemento no array execute isso
    elsif resultados_tipo.any?
      puts
      puts "Itens cadastrados buscando pelo tipo"
      puts
      resultados_tipo.each do |receita|
        puts "#{receita[:nome]} - #{receita[:tipo]}"
        puts
      end
    #se nao execute isso
    else
      puts
      puts "PESQUISA INVALIDA"
      puts
    end
end

#executa o metodo de bem vindo
bem_vindo()
#inicia o array de receitas
receitas = []
#executa o metodo do menu e salva na variavel opcao
opcao = menu()

loop do #inicia o loop
  if opcao == INSERIR_RECEITAS #se a opcao for essa
    receitas << adicior_receita() #cadaste o retorno do metodo adcicionar receita no array receitas
  elsif opcao == VER_RECEITAS #se a opcao for essa
    mostra_receita(receitas) #mostra o array receita passando ele como parametro para o metodo
  elsif opcao == BUSCAR_RECEITAS #se a opcao for essa
    cria_busca(receitas) #executa o metodo de busca e passa o array receita para ele como parametro
  elsif opcao == SAIR #se a opcao for essa
    break #quebra o loop aqui
  else # se nao for nem uma das de cima
    puts "opcao invalida" #imprime essa menssagem
  end
  opcao = menu() #nao importa a opcao gerada sempre retorna o menu na tela
end
puts 'Obrigado por usar o cookbook!' #menssagem de adeus