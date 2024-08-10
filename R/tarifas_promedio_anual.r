library(dplyr)
source("./R/utils/convert_date.r")
source("./R/utils/mean_by.r")

data <- read.csv("./data/raw/Tarifas_Mensuales_Modo_2012-2022.csv")

df <- data[ -c(1, nrow(data)), 2:length(data) ]

colnames(df) <- c(
    "Fecha",
    "Bus ($)",
    "Metro Horario Punta ($)",
    "Metro Horario Valle ($)",
    "Metro Horario Baja ($)",
    "Estudiante Media/Superior ($)",
    "Estudiante Basica ($)",
    "Adulto Mayor ($)"
)

# Castear a numerico
df[ , 2:length(df)] <- lapply(df[ , 2:length(df)], as.numeric)

# Agregar Columna Fecha
std_date <- sapply(df[[1]], convert_date)
df$Fecha <- as.Date(std_date, format="%d/%m/%Y")
df$Fecha <- as.numeric(format(df$Fecha, "%Y"))

promedios_anuales <- mean_by(df, "Fecha")

# jpeg("Tarifas-Promedio-Anuales_2012-2022.png", height=50*nrow(df), width=200*ncol(df), units = "px", bg="white", res=120)
# grid.newpage()
# grid.table(df, rows = NULL)
# dev.off()

write.csv(promedios_anuales, "./data/processed/Tarifas-Promedio-Anuales_2012-2022.csv")                                                  
