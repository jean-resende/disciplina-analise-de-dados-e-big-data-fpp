# Exemplo de Agrupamento (K-Means)

# Criando um conjunto de dados biológicos hipotético
dados_agrupamento <- data.frame(
  MetabolitoX = c(2.1, 2.8, 3.5, 4.2, 7.1, 7.8, 8.5, 9.2),
  MetabolitoY = c(1.5, 2.2, 2.9, 3.6, 6.5, 7.2, 7.9, 8.6)
)

# Definindo o número de clusters (k=2)
k <- 2

# Aplicando o algoritmo K-Means
resultado_kmeans <- kmeans(dados_agrupamento, centers = k)

# Exibindo os resultados do agrupamento
print(resultado_kmeans)

# Visualizando os clusters
png("agrupamento.png", width = 400, height = 300)
plot(dados_agrupamento$MetabolitoX, dados_agrupamento$MetabolitoY,
     col = resultado_kmeans$cluster, pch = 16,
     xlab = "Nível do Metabolito X", ylab = "Nível do Metabolito Y",
     main = "Agrupamento K-Means de Metabolitos")
points(resultado_kmeans$centers[, 1], resultado_kmeans$centers[, 2],
       col = 1:k, pch = 8, cex = 2) # Marcando os centroides
dev.off()