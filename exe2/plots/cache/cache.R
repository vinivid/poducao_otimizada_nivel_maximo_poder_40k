# Instale caso ainda não tenha
# install.packages("FrF2")
library(FrF2)

# ================================
# 1. Planejamento do experimento
# ================================
plan.person = FrF2(
  nruns = 4,
  nfactors = 2,
  replications = 1,
  repeat.only = FALSE,
  factor.names = list(
    Otimizacao = c("Sem otimizacao", "Interchange"),
    Alocacao   = c("Estatico", "Dinamico")
  ),
  randomize = FALSE
)

summary(plan.person)

# ================================
# 2. Resultados experimentais
# ================================35926436.9
cache_load = c(12986508639.0, 12988018608.0, 12988036298.6, 12987153635.9)
cache_miss = c(606909187.3, 35926436.9, 603837969.7, 35924733.0)

# ================================
# 3. Criação de designs separados
# ================================
# Design para cache_load
plan.load = add.response(plan.person, response = cache_load)
names(plan.load)[names(plan.load) == "resp"] <- "cache_load"

# Design para cache_miss
plan.misses = add.response(plan.person, response = cache_miss)
names(plan.misses)[names(plan.misses) == "resp"] <- "cache_miss"

# ================================
# 4. Gráficos
# ================================
# Cache Load
par(oma=c(0, 0, 8, 0))
MEPlot(plan.load, main = "Cache Load\nSem vs Loop Interchange")
par(oma=c(0, 0, 8, 0))
IAPlot(plan.load, main = "Interação Cache Load\nSem vs Loop Interchange")

# Cache Load Misses
par(oma=c(0, 0, 8, 0))
MEPlot(plan.load, main = "Cache Load Misses\nSem vs Loop Interchange")
par(oma=c(0, 0, 8, 0))
IAPlot(plan.load, main = "Interação Cache Load Misses\nSem vs Loop Interchange")

# ================================
# 5. Modelos lineares
# ================================
plan.formula.load = lm(cache_load ~ (Otimizacao * Alocacao), data = plan.load)
plan.formula.misses = lm(cache_miss ~ (Otimizacao * Alocacao), data = plan.misses)

summary(plan.formula.load)
summary(plan.formula.misses)

# ================================
# 6. ANOVA
# ================================
plan.anova.load = anova(plan.formula.load)
plan.anova.misses = anova(plan.formula.misses)

# Soma dos quadrados total
SST.load = sum(plan.anova.load$"Mean Sq"[1:3])
SST.misses = sum(plan.anova.misses$"Mean Sq"[1:3])

# Influência de cada fator
InfluenciaA.load  = plan.anova.load$"Mean Sq"[1] / SST.load
InfluenciaB.load  = plan.anova.load$"Mean Sq"[2] / SST.load
InfluenciaAB.load = plan.anova.load$"Mean Sq"[3] / SST.load

InfluenciaA.misses  = plan.anova.misses$"Mean Sq"[1] / SST.misses
InfluenciaB.misses  = plan.anova.misses$"Mean Sq"[2] / SST.misses
InfluenciaAB.misses = plan.anova.misses$"Mean Sq"[3] / SST.misses

cat("\nInfluência Cache Load:\n")
cat("Otimizacao:", InfluenciaA.load, "\n")
cat("Alocacao:", InfluenciaB.load, "\n")
cat("Interacao:", InfluenciaAB.load, "\n")

cat("\nInfluência Cache Load Misses:\n")
cat("Otimizacao:", InfluenciaA.misses, "\n")
cat("Alocacao:", InfluenciaB.misses, "\n")
cat("Interacao:", InfluenciaAB.misses, "\n")
