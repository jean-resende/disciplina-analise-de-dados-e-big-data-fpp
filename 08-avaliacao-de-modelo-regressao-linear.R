# Exemplo de Avaliação de Modelo (para Regressão Linear)

# Criando um conjunto de dados biológicos hipotético
dados_regressao <- data.frame(
  TamanhoTumor = c(2.1, 3.5, 4.0, 5.5, 6.1, 7.2, 8.0, 9.1, 9.8, 10.5),
  NivelProteina = c(15.3, 18.2, 20.1, 22.5, 24.3, 26.8, 28.1, 30.5, 32.0, 34.1)
)

# Construindo o modelo de regressão linear
modelo_linear <- lm(NivelProteina ~ TamanhoTumor, data = dados_regressao)

# Exibindo o resumo do modelo
summary(modelo_linear)

# Usando o modelo linear criado anteriormente (modelo_linear)
previsoes_linear <- predict(modelo_linear, newdata = dados_regressao)

# Calculando o Erro Médio Quadrático (RMSE)
rmse_linear <- sqrt(mean((dados_regressao$NivelProteina - previsoes_linear)^2))
print(paste("RMSE:", rmse_linear))

# Calculando o R-quadrado
r_squared_linear <- summary(modelo_linear)$r.squared
print(paste("R-quadrado:", r_squared_linear))
