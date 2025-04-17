################################################################################
# Nome: 00-tabela-de-dados.R                                                   #
#                                                                              #
# Autor: Jean Resende (jean.s.s.resende@gmail.com)                             #
################################################################################

# Criar o dataframe
dados_bio <- data.frame(
  Paciente = 1:8,
  GeneA = c(2.5, 2.1, 2.8, 1.9, NA, 2.6, 2.3, 5.1),
  GeneB = c(10.3, NA, 9.9, 10.5, 10.1, 11.2, 9.8, 10.4),
  ProteinaX = c(15.2, 14.8, 16.1, 15.5, 15.9, 17.8, NA, 16.3),
  Idade = c(65, 72, 58, 68, 60, 75, 62, 70),
  Condicao = factor(c("Doente", "Saudavel", "Doente", "Saudavel", "Doente", 
                      "Saudavel", "Doente", "Saudavel"))
)

# Visualizar o dataframe (opcional)
print(dados_bio)

# Exportando o dataframe
write.csv(dados_bio, "dados_bio.csv", row.names = F)
################################################################################