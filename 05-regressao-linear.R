# Exemplo de Regressão Linear

# Criando um conjunto de dados biológicos hipotético
dados_regressao <- data.frame(
  TamanhoTumor = c(2.1, 3.5, 4.0, 5.5, 6.1, 7.2, 8.0, 9.1, 9.8, 10.5),
  NivelProteina = c(15.3, 18.2, 20.1, 22.5, 24.3, 26.8, 28.1, 30.5, 32.0, 34.1)
)

# Construindo o modelo de regressão linear
modelo_linear <- lm(NivelProteina ~ TamanhoTumor, data = dados_regressao)

# Exibindo o resumo do modelo
summary(modelo_linear)

# Visualizando os resultados
png("reg_linear.png",width = 500, height = 300)
plot(dados_regressao$TamanhoTumor, dados_regressao$NivelProteina,
     xlab = "Tamanho do Tumor (cm)", ylab = "Nível da Proteína X",
     main = "Regressão Linear: Tamanho do Tumor vs. Nível de Proteína")
abline(modelo_linear, col = "red")
dev.off()



