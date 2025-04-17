# Exemplo Básico de Validação Cruzada (K-Fold com k=3 para Regressão Linear)
library(caret)

# Criando um conjunto de dados biológicos hipotético
dados_regressao <- data.frame(
  TamanhoTumor = c(2.1, 3.5, 4.0, 5.5, 6.1, 7.2, 8.0, 9.1, 9.8, 10.5),
  NivelProteina = c(15.3, 18.2, 20.1, 22.5, 24.3, 26.8, 28.1, 30.5, 32.0, 34.1)
)

# Definindo o controle para validação cruzada com 3 folds
controle_cv <- trainControl(method = "cv", number = 3)

# Treinando o modelo com validação cruzada
modelo_cv_linear <- train(NivelProteina ~ TamanhoTumor, data = dados_regressao,
                          method = "lm", trControl = controle_cv)

# Exibindo os resultados da validação cruzada
print(modelo_cv_linear)
