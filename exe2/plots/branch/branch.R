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
    Otimizacao = c("Sem otimizacao", "Loop interchange"),
    Alocacao   = c("Estatico", "Dinamico")
  ),
  randomize = FALSE
)

summary(plan.person)

# ================================
# 2. Resultados experimentais
# ================================
branch_instr = c(12986508639.0, 12988036298.6, 12988018608.0, 12987153635.9)
branch_misses = c(606909187.3, 603837969.7, 35926436.9, 35924733.0)

# ================================
# 3. Criação de designs separados
# ================================
# Design para branch_instr
plan.instr = add.response(plan.person, response = branch_instr)
names(plan.instr)[names(plan.instr) == "resp"] <- "branch_instr"

# Design para branch_misses
plan.misses = add.response(plan.person, response = branch_misses)
names(plan.misses)[names(plan.misses) == "resp"] <- "branch_misses"

# ================================
# 4. Gráficos
# ================================
# Branch Instructions
MEPlot(plan.instr)
IAPlot(plan.instr)

# Branch Misses
MEPlot(plan.misses)
IAPlot(plan.misses)

# ================================
# 5. Modelos lineares
# ================================
plan.formula.instr = lm(branch_instr ~ (Otimizacao * Alocacao), data = plan.instr)
plan.formula.misses = lm(branch_misses ~ (Otimizacao * Alocacao), data = plan.misses)

summary(plan.formula.instr)
summary(plan.formula.misses)

# ================================
# 6. ANOVA
# ================================
plan.anova.instr = anova(plan.formula.instr)
plan.anova.misses = anova(plan.formula.misses)

# Soma dos quadrados total
SST.instr = sum(plan.anova.instr$"Mean Sq"[1:3])
SST.misses = sum(plan.anova.misses$"Mean Sq"[1:3])

# Influência de cada fator
InfluenciaA.instr  = plan.anova.instr$"Mean Sq"[1] / SST.instr
InfluenciaB.instr  = plan.anova.instr$"Mean Sq"[2] / SST.instr
InfluenciaAB.instr = plan.anova.instr$"Mean Sq"[3] / SST.instr

InfluenciaA.misses  = plan.anova.misses$"Mean Sq"[1] / SST.misses
InfluenciaB.misses  = plan.anova.misses$"Mean Sq"[2] / SST.misses
InfluenciaAB.misses = plan.anova.misses$"Mean Sq"[3] / SST.misses

cat("\nInfluência Branch Instructions:\n")
cat("Otimizacao:", InfluenciaA.instr, "\n")
cat("Alocacao:", InfluenciaB.instr, "\n")
cat("Interacao:", InfluenciaAB.instr, "\n")

cat("\nInfluência Branch Misses:\n")
cat("Otimizacao:", InfluenciaA.misses, "\n")
cat("Alocacao:", InfluenciaB.misses, "\n")
cat("Interacao:", InfluenciaAB.misses, "\n")
