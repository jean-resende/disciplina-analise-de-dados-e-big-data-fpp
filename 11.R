dados_bio <- read.csv("dados_bio.csv")

# Gráfico de Barras (comparando a média de GeneA por Condição)
library(ggplot2)

png("graf_barra.png", width = 400, height = 300)
ggplot(dados_bio, aes(x = Condicao, y = GeneA)) +
  stat_summary(fun = "mean", geom = "bar", fill = "steelblue") +
  stat_summary(fun.data = "mean_se", geom = "errorbar", width = 0.2) +
  labs(title = "Média de Expressão de GeneA por Condição", x = "Condição", y = "Nível de Expressão de GeneA")
dev.off()


# Gráfico de Linha (tendência hipotética ao longo do tempo)
library(ggplot2)

# Criando dados hipotéticos de série temporal
dados_tempo <- data.frame(
  Tempo = 1:10,
  Valor = c(12, 15, 18, 16, 20, 22, 25, 23, 27, 30)
)

png("graf_linha.png", width = 400, height = 300)
ggplot(dados_tempo, aes(x = Tempo, y = Valor)) +
  geom_line(color = "purple", size = 1) +
  geom_point(color = "purple", size = 3) +
  labs(title = "Tendência ao Longo do Tempo", x = "Tempo", y = "Valor")
dev.off()


# Gráfico de Dispersão (relação entre GeneA e ProteinaX)
library(ggplot2)

png("graf_disp.png", width = 400, height = 300)
ggplot(dados_bio, aes(x = GeneA, y = ProteinaX)) +
  geom_point(color = "darkgreen", size = 3) +
  labs(title = "Relação entre GeneA e ProteinaX", x = "Nível de Expressão de GeneA", y = "Nível de ProteínaX")
dev.off()



# Histograma (distribuição da Idade)
library(ggplot2)

png("graf_hist.png", width = 400, height = 300)
ggplot(dados_bio, aes(x = Idade)) +
  geom_histogram(binwidth = 5, fill = "orange", color = "black") +
  labs(title = "Distribuição da Idade dos Pacientes", x = "Idade (anos)", y = "Frequência")
dev.off()


# Boxplot (distribuição de GeneA por Condição)
library(ggplot2)

png("graf_boxplot.png", width = 400, height = 300)
ggplot(dados_bio, aes(x = Condicao, y = GeneA)) +
  geom_boxplot(fill = "lightblue") +
  labs(title = "Distribuição da Expressão de GeneA por Condição", x = "Condição", y = "Nível de Expressão de GeneA")
dev.off()



# Mapa de Calor (correlação entre variáveis numéricas)
library(ggplot2)
library(dplyr)
library(reshape2)

dados_numericos <- dados_bio %>% select(GeneA, GeneB, ProteinaX, Idade)
matriz_correlacao <- cor(dados_numericos, use = "pairwise.complete.obs")
dados_correlacao <- melt(matriz_correlacao)

png("graf_heatmap.png", width = 400, height = 400)
ggplot(dados_correlacao, aes(Var1, Var2, fill = value)) +
  geom_tile(color = "white") +
  scale_fill_gradient2(low = "blue", mid = "white", high = "red",
                       midpoint = 0, limit = c(-1,1), space = "Lab",
                       name="Correlação de Pearson") +
  theme_minimal() +
  #theme(axis.text.x = element_text(angle = 45, vjust = 1,
  #                                 size = 12, hjust = 1)) +
  coord_fixed() +
  labs(title = "Mapa de Calor da Correlação entre Variáveis")
dev.off()



# Gráfico de Pizza (proporção hipotética de tipos de dados)
library(ggplot2)

# Criando dados hipotéticos para o gráfico de pizza
dados_pizza <- data.frame(
  Tipo = c("Genômicos", "Proteômicos", "Clínicos", "Imagens"),
  Percentual = c(40, 25, 20, 15)
)

# Calculando as posições para as etiquetas
dados_pizza <- dados_pizza %>%
  arrange(desc(Tipo)) %>%
  mutate(ypos = cumsum(Percentual) - 0.5*Percentual )

png("graf_setores.png", width = 400, height = 300)
ggplot(dados_pizza, aes(x="", y=Percentual, fill=Tipo)) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0) +
  theme_void() + # Remove o fundo do tema
  geom_text(aes(y = ypos, label = paste0(Percentual, "%")), color = "black", size=6) +
  labs(title = "Proporção dos Tipos de Dados Biológicos")
dev.off()


# Gráfico de Área (tendência hipotética ao longo do tempo por grupo)
library(ggplot2)

# Criando dados hipotéticos de série temporal por grupo
dados_area <- data.frame(
  Tempo = rep(1:10, times = 2),
  Valor = c(12, 15, 18, 16, 20, 22, 25, 23, 27, 30,
            10, 13, 15, 14, 18, 20, 22, 20, 24, 27),
  Grupo = factor(rep(c("Grupo A", "Grupo B"), each = 10))
)

png("graf_area.png", width = 400, height = 300)
ggplot(dados_area, aes(x = Tempo, y = Valor, fill = Grupo)) +
  geom_area(alpha = 0.6) +
  labs(title = "Tendência ao Longo do Tempo por Grupo", x = "Tempo", y = "Valor") +
  scale_fill_manual(values = c("steelblue", "orange")) # Definindo cores para os grupos
dev.off()
