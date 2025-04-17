# Exemplo de Classificação (Regressão Logística)

# Criando um conjunto de dados biológicos hipotético
dados_classificacao <- data.frame(
  NivelGeneA = c(1.2, 1.8, 2.5, 3.1, 0.9, 1.5, 2.1, 2.8),
  NivelGeneB = c(4.5, 5.1, 5.8, 6.5, 3.8, 4.2, 4.9, 5.6),
  RespostaTratamento = factor(c("Sim", "Sim", "Sim", "Sim", "Não", "Não", "Não", "Não"))
)

# Construindo o modelo de regressão logística
modelo_logistico <- glm(RespostaTratamento ~ NivelGeneA + NivelGeneB,
                        data = dados_classificacao, family = "binomial")

# Exibindo o resumo do modelo
summary(modelo_logistico)

# Visualizando os resultados (requer um pouco mais de manipulação para regressão logística)
probabilidades <- predict(modelo_logistico, type = "response")

png("reg_log.png",width = 500, height = 300)
plot(dados_classificacao$NivelGeneA, dados_classificacao$NivelGeneB,
     col = ifelse(dados_classificacao$RespostaTratamento == "Sim", "blue", "red"),
     pch = 16, xlab = "Nível do Gene A", ylab = "Nível do Gene B",
     main = "Regressão Logística: Genes vs. Resposta ao Tratamento")

# Adicionando uma fronteira de decisão aproximada (simplificado para demonstração)
abline(a = 3, b = -0.8, col = "gray", lty = 2)
legend("topright", legend = c("Sim", "Não"), col = c("blue", "red"), pch = 16)
dev.off()