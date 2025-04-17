################################################################################
# Nome: visualizacao.r                                                         #
#                                                                              #
# Autor: Jean Resende (jean.s.s.resende@gmail.com)                             #
################################################################################
dados_bio <- read.csv("dados_bio.csv")

# boxplot
png("boxplot_geneA.png", width = 400, height = 300)
boxplot(dados_bio$GeneA,
        main = "Boxplot de GeneA",
        ylab = "Nível de Expressão de GeneA")
dev.off()

# Boxplot da expressão de GeneB por condição (após remover NA's)
png("boxplot_geneB_condicao.png", width = 400, height = 300)
boxplot(dados_bio$GeneB ~ dados_bio$Condicao, 
        main="Expressão de GeneB por Condição", 
        xlab="Condição", 
        ylab="Nível de Expressão de GeneB")
dev.off()

# histograma
png("histograma_ProteinaX.png", width = 400, height = 300)
hist(dados_bio$ProteinaX,
     main = "Histograma de ProteinaX", 
     xlab = "Nível de ProteinaX", 
     ylab = "Frequência")
dev.off()

# Histograma de GeneA antes da transformação
png("histograma_GeneAOriginal.png", width = 400, height = 300)
hist(dados_bio$GeneA, 
     main="Distribuição de GeneA (Original)", 
     xlab="Nível de Expressão", 
     ylab="Frequência")
dev.off()

# Aplicar transformação logarítmica (base 2)
dados_bio$Log2GeneA <- log2(dados_bio$GeneA + 1)

# Histograma de GeneA após a transformação logarítmica
png("histograma_GeneALog2.png", width = 400, height = 300)
hist(dados_bio$Log2GeneA,
     main="Distribuição de Log2(GeneA + 1)",
     xlab="Nível de Expressão (Log2)",
     ylab="Frequência")
dev.off()

# Histograma para pacientes Doentes
png("histograma_psc_doente.png")
hist(dados_bio$Idade[dados_bio$Condicao == "Doente"], 
     col="red", main="Distribuição de Idades por Condição", 
     xlab="Idade", ylab="Frequência", xlim=range(dados_bio$Idade), ylim=c(0,3))
# Adicionar histograma para pacientes Saudáveis
hist(dados_bio$Idade[dados_bio$Condicao == "Saudavel"], col="blue", add=TRUE)
legend("topright", legend=c("Doente", "Saudavel"), fill=c("red", "blue"))
dev.off()

# Gráfico de dispersão entre Idade e ProteinaX
png("dispersao_protIdade.png", width = 400, height = 300)
plot(dados_bio$Idade, 
     dados_bio$ProteinaX, 
     main="Relação entre Idade e ProteinaX", 
     xlab="Idade (anos)", 
     ylab="Nível de ProteínaX")
dev.off()
