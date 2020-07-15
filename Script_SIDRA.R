
#carregando pacotes necessárioS caso não os tenha, instale em Tools ou manualmente com install.packages(nome do pacote)

library(sidrar)
library(ggplot2)
library(scales)
library(dynlm)


##### puxando os dados da população ocupada da PNAD
tabela = get_sidra(api='/t/6379/n1/all/v/4097/p/all/d/V4097%202')

times = seq(as.Date('2018-01-01'), as.Date('2020-05-01'), 
            by='month')

#salvando em um data.frame

desemprego = data.frame(time=times, desemprego=tail(tabela$Valor, 29))

#criando um gráfico

ggplot(desemprego, aes(x=time, y=desemprego))+
  geom_line(size=.8, colour='darkblue')+
  scale_x_date(breaks = date_breaks("1 months"),
               labels = date_format("%b/%Y"))+
  theme(axis.text.x=element_text(angle=90, hjust=1))+
  geom_point(size=9, shape=21, colour="#1a476f", fill="white")+
  geom_text(aes(label=round(desemprego,1)), size=3, 
            hjust=0.5, vjust=0.5, shape=21, colour="#1a476f")+
  xlab('')+ylab('%')+
  labs(title='Nivel de ocupação PNAD Contínua',
       subtitle='População ocupada em relação à PEA',
       caption='Fonte: Elaboração de Bruno Leonardo com dados do IBGE.')

#instruções para demais variaveis do SIDRA/IBGE

#1) identifique o codigo do indicador no SIDRA, no caso da tabela 6379 é O nivel de ocupação PNAD

#2) acesse o endereço: www.api.sidra.ibge.gov.br

#3) no campo tabela inclua o código da tabela que predente extrair e clique em descrever;

# depois clique em obter ajuda sobre o API e siga as intruções de preenchimento da linha 11 deste script