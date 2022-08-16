Trabalho Prático 2 de Banco de Dados
Autores: Joana Martins e Juliane Ferreira
Professor: Rodrigo Laiola

Como executar:
1 - Descompate a pasta 
2 - Abra a pasta no terminal
3 - Digite "docker compose up"
4 - Abra o navegador em "localhost:8080"
5 - Acesse o adminer com o Postgresql com Usuário: user e Senha: 123
6 - Copie o conteúdo do arquivo "consulta.sql" (NOTA: esse arquivo já executa um exemplo de teste)
7 - Abra uma nova consulta no Adminer e cole o conteúdo do arquivo.
8 - Clique em executar!

Explicação dos resultados:
1 - Caso retorne o valor 1 na coluna "Resultados" é porque há ciclos.
2 - Caso retorne vazio, é porque não há ciclos.

Testes:
1 - Troque os valores de insersão da tabela "Schedule" no arquivo "consulta.sql" para a inserção 
que deseja testar.
2 - Na pasta resultados tem os resultados esperados dos testes feitos. 
