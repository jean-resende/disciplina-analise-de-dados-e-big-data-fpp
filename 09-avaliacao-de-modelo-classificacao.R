# Exemplo de Avaliação de Modelo (para Classificação - usando dados de treinamento como exemplo)

# Criando um conjunto de dados biológicos hipotético
dados_classificacao <- data.frame(
  NivelGeneA = c(1.2, 1.8, 2.5, 3.1, 0.9, 1.5, 2.1, 2.8),
  NivelGeneB = c(4.5, 5.1, 5.8, 6.5, 3.8, 4.2, 4.9, 5.6),
  RespostaTratamento = factor(c("Sim", "Sim", "Sim", "Sim", "Não", "Não", "Não", "Não"))
)

# Construindo o modelo de regressão logística
modelo_logistico <- glm(RespostaTratamento ~ NivelGeneA + NivelGeneB,
                        data = dados_classificacao, family = "binomial")

# Usando o modelo logístico criado anteriormente (modelo_logistico)
probabilidades_logistico <- predict(modelo_logistico, newdata = dados_classificacao, type = "response")
previsoes_categoricas <- ifelse(probabilidades_logistico > 0.5, "Sim", "Não")

# Calculando a acurácia
acuracia_logistico <- mean(previsoes_categoricas == dados_classificacao$RespostaTratamento)
print(paste("Acurácia:", acuracia_logistico))

# (Outras métricas como precisão, recall e F1-score exigiriam mais código ou o uso de pacotes como 'caret')
