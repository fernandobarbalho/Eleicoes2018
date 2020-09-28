library(readr)
library(dplyr)

arq_perfil<- "perfil_eleitor_secao_2018_DF.csv"
arq_votacao<- "bweb_1t_DF_101020181947.csv"


perfil_eleitor_secao_2018<-read.csv2(arq_perfil,sep = ";",header = TRUE,  stringsAsFactors = FALSE)


votacao <- read.csv2(arq_votacao,sep = ";",header = TRUE)

#filtra apenas resultado para presidente

votacao<-votacao %>% filter(DS_CARGO_PERGUNTA == "Presidente")

#Seleciona colunas consideradas úteis
votacao<-votacao[,c(11,12,13,14,19,21,22,23,30)]

perfil_eleitor_secao_2018<- perfil_eleitor_secao_2018[,c(4,5,6,9,10,12,14,16,18,19)]

unique(perfil_eleitor_secao_2018$DS_GRAU_ESCOLARIDADE)

perfil_eleitor_secao_2018$DS_GRAU_ESCOLARIDADE[perfil_eleitor_secao_2018$DS_GRAU_ESCOLARIDADE=="ENSINO MÉDIO INCOMPLETO"]<- "ENSINO MEDIO INCOMPLETO"

perfil_eleitor_secao_2018$DS_GRAU_ESCOLARIDADE[perfil_eleitor_secao_2018$DS_GRAU_ESCOLARIDADE=="ENSINO MÉDIO COMPLETO"]<- "ENSINO MEDIO COMPLETO"

perfil_eleitor_secao_2018$DS_GRAU_ESCOLARIDADE[perfil_eleitor_secao_2018$DS_GRAU_ESCOLARIDADE=="LÊ E ESCREVE"]<- "LE E ESCREVE"

perfil_eleitor_secao_2018$DS_GRAU_ESCOLARIDADE[perfil_eleitor_secao_2018$DS_GRAU_ESCOLARIDADE=="NÃO INFORMADO"]<- "NAO INFORMADO"

unique(perfil_eleitor_secao_2018$DS_GRAU_ESCOLARIDADE)




save(list = "votacao", file = "votacao.RData")
save(list = "perfil_eleitor_secao_2018", file = "perfil_eleitor_secao_2018.RData")



