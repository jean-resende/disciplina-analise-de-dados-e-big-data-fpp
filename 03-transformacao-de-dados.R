################################################################################
# Nome: transformacao-de-dados.r                                                         #
#                                                                              #
# Autor: Jean Resende (jean.s.s.resende@gmail.com)                             #
################################################################################
dados_bio <- read.csv("dados_bio.csv")

# Normalização Min-Max da coluna GeneA
dados_sem_na <- na.omit(dados_bio)
min_geneA <- min(dados_sem_na$GeneA, na.rm = T)
max_geneA <- max(dados_sem_na$GeneA, na.rm = T)
dados_sem_na$GeneA_normalizado <- (dados_sem_na$GeneA - min_geneA) / (max_geneA - min_geneA)
print(head(dados_sem_na))

# Padronização (Z-score) da coluna ProteinaX
media_proteinaX <- mean(dados_sem_na$ProteinaX)
dp_proteinaX <- sd(dados_sem_na$ProteinaX)
dados_sem_na$ProteinaX_padronizado <- (dados_sem_na$ProteinaX - media_proteinaX) / dp_proteinaX
print(head(dados_sem_na))

# Discretização da coluna Idade em faixas etárias
faixas_etarias <- cut(dados_sem_na$Idade,
                      breaks = c(0, 60, 70, Inf),
                      labels = c("<=60", "61-70", ">70"))
dados_sem_na$FaixaEtaria <- faixas_etarias
print(table(dados_sem_na$FaixaEtaria)) # Visualiza a frequência em cada faixa
