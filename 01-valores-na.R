################################################################################
# Nome: valores-faltantes.r                                                    #
#                                                                              #
# Autor: Jean Resende (jean.s.s.resende@gmail.com)                             #
################################################################################
dados_bio <- read.csv("dados_bio.csv")

# Verificar valores faltantes por coluna
print(colSums(is.na(dados_bio)))

# sem NA
dados_bio_sem_na <- na.omit(dados_bio)
print(dados_bio_sem_na)

# com base na porcentagem
dados_bio_perc05 <- dados_bio[, colMeans(is.na(dados_bio)) <= 0.5]
print(dados_bio_perc05)

# Imputar valores faltantes na coluna GeneA com a média
media_geneA <- mean(dados_bio$GeneA, na.rm = TRUE)
dados_bio$GeneA[is.na(dados_bio$GeneA)] <- media_geneA
print(dados_bio)

# Verificar a quantidade de valores faltantes em GeneB
sum(is.na(dados_bio$GeneB))

# Remover as linhas com valores faltantes em GeneB
dados_bio_limpo_geneB <- dados_bio[!is.na(dados_bio$GeneB), ]
print(dados_bio_limpo_geneB)

# Verificar a quantidade de valores faltantes em ProteinaX
sum(is.na(dados_bio$ProteinaX))

# Para ProteinaX, poderíamos decidir imputar com a mediana, que é menos sensível a outliers
mediana_proteinaX <- median(dados_bio$ProteinaX, na.rm = TRUE)
dados_bio$ProteinaX[is.na(dados_bio$ProteinaX)] <- mediana_proteinaX
print(dados_bio)

# Usando a coluna "Idade" para prever valores faltantes em "GeneB"
modelo_regressao_geneB <- lm(GeneB ~ Idade, data = dados_bio[!is.na(dados_bio$GeneB), ])
dados_bio$GeneB[is.na(dados_bio$GeneB)] <- predict(modelo_regressao_geneB, newdata = dados_bio[is.na(dados_bio$GeneB), ])

# Visualizar o dataframe com os valores imputados (opcional)
print(dados_bio)
################################################################################