% automovel(Renavam,Placa,propietario(Nome,Sobrenome,Logradouro,Numero,Complemento,Cidade,Estado,CEP,Celular,Telefone),Marca,Modelo,AnoFabricacao).
:- dynamic automovel/6.

cadastro:-
    write('\e[2J'),
    writeln('***************************************'),
    writeln('*       CADASTRO DE AUTOMOVEIS        *'),
    writeln('***************************************'),
    nl,
    writeln('Escolha qual opcao deseja executar:'),
    nl,
    writeln('1-Incluir.'),
    writeln('2-Localizar automovel pelo Proprietário.'),
    writeln('3-Localizar automovel pela Placa'),
    writeln('4-Localizar automovel pelo Renavam'),
    writeln('5-Excluir automóvel'),
    writeln('6-Quantidade de veículos cadastrados'),
    writeln('7-Salvar dados em arquivo'),
    writeln('8-Carregar dados de arquivo'),
    writeln('9-Limpar dados de cadastro'),
    writeln('10-Relatorio de veiculos'),
    writeln('11-Sair'),
    nl,
    writeln('Informe a opcao:'),
    read(X),
    opcao(X).

opcao(1) :-
    write("Renavam:  "),
    read(A),
    nl,
    write("Placa:   "),
    read(B),
    nl,
    write("Nome:   "),
    read(C),
    nl,
    write("Sobrenome:   "),
    read(D),
    nl,
    write("Logradouro:   "),
    read(E),
    nl,
    write("Numero:   "),
    read(F),
    nl,
    write("Complemento:  "),
    read(G),
    nl,
    write("Cidade:   "),
    read(H),
    nl,
    write("Estado:    "),
    read(I),
    nl,
    write("CEP:    "),
    read(J),
    nl,
    write("Celular:   "),
    read(K),
    nl,
    write("Telefone:  "),
    read(L),
    nl,
    write("Marca:   "),
    read(M),
    nl,
    write("Modelo:    "),
    read(N),
    nl,
    write("Ano de fabricacao: "),
    read(O),
    nl,
    assert(automovel(A,B,proprietario(C,D,E,F,G,H,I,J,K,L),M,N,O)),
    writeln("Registro incluido com sucesso."),
    writeln("Digite algo para continuar..."),
    read(_),
    cadastro.

opcao(2) :-
    current_predicate(automovel/6),
    writeln('Nome do proprietario: '),
    read(C),
    automovel(A,B,proprietario(C,D,E,F,G,H,I,J,K,L),M,N,O),
    printCar(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O),
    writeln('Digite qualquer coisa para continuar...'),
    read(_),
    cadastro.

opcao(2) :-
    writeln('Digite qualquer coisa para continuar'),
    read(_),
    cadastro.

opcao(3) :-
    current_predicate(automovel/6),
    writeln('Placa do veículo: '),
    read(B),
    automovel(A,B,proprietario(C,D,E,F,G,H,I,J,K,L),M,N,O),
    printCar(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O),
    writeln('Digite qualquer coisa para continuar...'),
    read(_),
    cadastro.

opcao(3) :-
    writeln('Digite qualquer coisa para continuar'),
    read(_),
    cadastro.

opcao(4) :-
    current_predicate(automovel/6),
    writeln('Renavam do veículo: '),
    read(A),
    automovel(A,B,proprietario(C,D,E,F,G,H,I,J,K,L),M,N,O),
    printCar(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O),
    writeln('Digite qualquer coisa para continuar...'),
    read(_),
    cadastro.

opcao(4) :-
    writeln('Digite qualquer coisa para continuar'),
    read(_),
    cadastro.

opcao(5) :-
    writeln('Digite a placa do veiculo que deseja excluir: '),
    read(P),
    retract(automovel(_,P,proprietario(_,_,_,_,_,_,_,_,_,_),_,_,_)),
    writeln('Veiculo excluido com sucesso. '),
    writeln('Digite qualquer coisa para continuar...'),
    read(_),
    cadastro.

opcao(6) :-
    cadastro.

opcao(7) :-
    tell('automoveis_save.txt'),
    listing(automovel/6),
    told,
    writeln('Arquivo automoveis_save gravado com sucesso'),
    read(_),
    cadastro.

opcao(8) :-
    writeln('Digite o nome do arquivo: '),
    read(A),
    consult(A),
    writeln('Arquivo carregado'),
    writeln('Digite qualquer coisa para continuar...'),
    read(_),
    cadastro.

opcao(9) :-
    abolish(automovel/6),
    writeln('Dados apagados com sucesso.'),
    writeln('Digite qualquer coisa para continuar...'),
    read(_),
    cadastro.

opcao(10) :-
    current_predicate(automovel/6),
    automovel.

opcao(10) :-
    writeln('Digite qualquer coisa para continuar...'),
    read(_),
    cadastro.

automovel :-
    writeln(" +++++++++++++++++++++++++++++++++++++++++++ "),
    nl,
    automovel(A,B,proprietario(C,D,E,F,G,H,I,J,K,L),M,N,O),
    printCar(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O),
    writeln(" +++++++++++++++++++++++++++++++++++++++++++ "),
    nl,nl,nl,nl,
    fail,
    writeln('Digite qualquer coisa para continuar...'),
    read(_),
    cadastro.

opcao(11) :-
    writeln('Obrigado por utilizar o sistema.').

printCar(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O) :-
    writeln(' Renavam   Placa   Nome  Sobrenome'),
    writeln('-----------------------------'),
    write(A),
    write('   '),
    write(B),
    write('   '),
    write(C),
    write('   '),
    write(D),
    write('   '),
    nl,
    writeln('-----------------------------'),
    writeln(' Marca       Modelo   Ano  Logradouro '),
    writeln('-----------------------------'),
    write(M),
    write('   '),
    write(N),
    write('   '),
    write(O),
    write('   '),
    write(E),
    write('   '),
    nl,
    writeln('-----------------------------'),
    writeln(' Numero Complemento Cidade Estado'),
    writeln('-----------------------------'),
    write(F),
    write('   '),
    write(G),
    write('   '),
    write(H),
    write('   '),
    write(I),
    write('   '),
    nl,
    writeln('-----------------------------'),
    writeln(' CEP        Celular     Telefone '),
    writeln('-----------------------------'),
    write(J),
    write('   '),
    write(K),
    write('   '),
    write(L),
    write('   '),
    nl,
    writeln('-----------------------------').
