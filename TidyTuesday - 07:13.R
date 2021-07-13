scoobydoo <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-07-13/scoobydoo.csv')
View(scoobydoo)

install.packages("ggrepel")
library(ggrepel)
library(httr)
library(readr)
library(ggplot2)
install.packages("viridis")
library(viridis)

scoobydoo$year <- format(scoobydoo$date_aired, format="%Y")

scoob<-scoobydoo[!(scoobydoo$motive=="NULL" | scoobydoo$season=="Crossover" | 
                     scoobydoo$season=="Movie" | scoobydoo$season=="Special" 
                   | scoobydoo$format=="Crossover" | scoobydoo$format=="TV Series (segmented)"),]

scoob<-scoobydoo[(scoobydoo$monster_gender=="Male" | scoobydoo$monster_gender=="Female"),]

View(scoob)

scooby_graphs <- ggplot(scoob, aes(x=monster_gender,y=factor(monster_gender),fill=monster_gender)) +
  geom_bar(stat="identity") +
  facet_wrap(~year) +
  ggtitle("Monster Gender in Scooby Doo by Year") +
  theme(plot.title = element_text(family="Trebuchet MS", face="bold", size=20, 
                                  hjust=0, color="#555555")) +
  theme(axis.text.x = element_text(angle=90)) +
  scale_y_discrete(guide = guide_axis(n.dodge=3)) +
  theme(axis.text.y=element_blank(),
        axis.ticks.y=element_blank()) +
  scale_fill_manual(values=c("#F9E014", "#17BDB9")) +
  xlab("Monster gender") +
  ylab("Number of monsters") +
  theme(axis.title.x=element_text(family="Trebuchet MS", size=13, 
                                  hjust=0.5, color="#555555")) +
  theme(axis.title.y=element_text(family="Trebuchet MS", size=13, 
                                  hjust=0.5, color="#555555")) +
  labs(fill = "Monster Gender") +
  theme(legend.title=element_text(family="Trebuchet MS", size=10, 
                                  hjust=0.5, color="#555555"))

scooby_graphs

citation("tidytuesdayR")



