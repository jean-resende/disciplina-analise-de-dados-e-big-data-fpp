################################################################################
# Nome: exploracao-de-dados.r                                               #           #
#                                                                              #
# Autor: Jean Resende (jean.s.s.resende@gmail.com)                             #
################################################################################
# Pacotes necessarios
library(dplyr)
library(ggplot2)
library(corrplot)
library(dplyr)

dados_bio <- read.csv("dados_bio.csv")

# Estatísticas descritivas para GeneA e GeneB, agrupadas por Condicao
estatisticas_por_condicao <- dados_bio %>%
  group_by(Condicao) %>%
  summarize(
    Media_GeneA = mean(GeneA, na.rm = TRUE),
    Mediana_GeneA = median(GeneA, na.rm = TRUE),
    DesvioPadrao_GeneA = sd(GeneA, na.rm = TRUE),
    Media_GeneB = mean(GeneB, na.rm = TRUE),
    Mediana_GeneB = median(GeneB, na.rm = TRUE),
    DesvioPadrao_GeneB = sd(GeneB, na.rm = TRUE)
  )
print(estatisticas_por_condicao)


png("media_GeneA.png", width = 400, height = 300)
ggplot(dados_bio, aes(x = Condicao, y = GeneA)) +
  stat_summary(fun = "mean", geom = "bar", fill = "steelblue") +
  stat_summary(fun.data = "mean_se", geom = "errorbar", width = 0.2) +
  labs(title = "Média de Expressão de GeneA por Condição", x = "Condição", y = "Nível de Expressão de GeneA")
dev.off()

png("densidade_idade.png", width = 400, height = 300)
ggplot(dados_bio, aes(x = Idade, fill = Condicao)) +
  geom_density(alpha = 0.5) +
  labs(title = "Distribuição da Idade por Condição", x = "Idade (anos)", y = "Densidade")
dev.off()



# Selecionar apenas as colunas numéricas para a correlação
dados_numericos <- dados_bio %>% select(GeneA, GeneB, ProteinaX, Idade)

# Calcular a matriz de correlação
matriz_correlacao <- cor(dados_numericos, use = "pairwise.complete.obs")

# Gerar o heatmap
corrplot(matriz_correlacao, method = "color",
         type = "upper", tl.col = "black", tl.srt = 45)
################################################################################