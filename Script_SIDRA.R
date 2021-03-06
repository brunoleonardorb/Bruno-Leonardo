
#carregando pacotes necess�rioS caso n�o os tenha, instale em Tools ou manualmente com install.packages(nome do pacote)

library(sidrar)
library(ggplot2)
library(scales)
library(dynlm)


##### puxando os dados da popula��o ocupada da PNAD
tabela = get_sidra(api='/t/6379/n1/all/v/4097/p/all/d/V4097%202')

times = seq(as.Date('2018-01-01'), as.Date('2020-05-01'), 
            by='month')

#salvando em um data.frame

desemprego = data.frame(time=times, desemprego=tail(tabela$Valor, 29))

#criando um gr�fico

ggplot(desemprego, aes(x=time, y=desemprego))+
  geom_line(size=.8, colour='darkblue')+
  scale_x_date(breaks = date_breaks("1 months"),
               labels = date_format("%b/%Y"))+
  theme(axis.text.x=element_text(angle=90, hjust=1))+
  geom_point(size=9, shape=21, colour="#1a476f", fill="white")+
  geom_text(aes(label=round(desemprego,1)), size=3, 
            hjust=0.5, vjust=0.5, shape=21, colour="#1a476f")+
  xlab('')+ylab('%')+
  labs(title='Nivel de ocupa��o PNAD Cont�nua',
       subtitle='Popula��o ocupada em rela��o � PEA',
       caption='Fonte: Elabora��o de Bruno Leonardo com dados do IBGE.')

#instru��es para demais variaveis do SIDRA/IBGE

#1) identifique o codigo do indicador no SIDRA, no caso da tabela 6379 � O nivel de ocupa��o PNAD

#2) acesse o endere�o: www.api.sidra.ibge.gov.br

#3) no campo tabela inclua o c�digo da tabela que predente extrair e clique em descrever;

# depois clique em obter ajuda sobre o API e siga as intru��es de preenchimento da linha 11 deste script