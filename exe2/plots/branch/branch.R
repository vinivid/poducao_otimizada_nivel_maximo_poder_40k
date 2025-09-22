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
    Otimizacao = c("Sem otimizacao", "Unrolling"),
    Alocacao   = c("Estatico", "Dinamico")
  ),
  randomize = FALSE
)

summary(plan.person)

# ================================
# 2. Resultados experimentais
# ================================727024.5
branch_instr = c(574935156.0, 78703666.8, 574934672.0, 78703259.8)
branch_misses = c(726856.6, 727024.5, 727347.6, 727301.5)

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
par(mar=c(0, 0, 8, 0))
MEPlot(plan.instr, main = "Branch Instructions\nSem vs Loop Unrolling")
par(mar=c(0, 0, 8, 0))
IAPlot(plan.instr, main = "Interação Branch Instructions\nSem vs Loop Unrolling")

# Branch Misses
par(mar=c(0, 0, 8, 0))
MEPlot(plan.misses, main = "Branch Misses\nSem vs Loop Unrolling")
par(mar=c(0, 0, 8, 0))
IAPlot(plan.misses, main = "Interação Branch Misses\nSem vs Loop Unrolling")

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
