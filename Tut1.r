library(ggplot2)
library(tidyverse)
library(gridExtra)

#Question 1
q1 <- c(572, 572, 573, 568, 569, 575, 565, 570)
summary(q1)

smokers <- c(69.3,56.0,22.1,47.6,53.2,48.1,52.7,34.4,60.2,43.8,23.2,13.8)
nonSmokers <- c(28.6,25.1,26.4,34.9,29.8,28.4,38.5,30.2,30.6,31.6,41.6,21.1,36.0,37.9,13.9)
summary(smokers)
summary(nonSmokers)

#Question 2
sample <- c(smokers, nonSmokers)
type <- c(rep("smokers",length(smokers)),rep("nonSmokers",length(nonSmokers)))
type
q2 <- data.frame(type, sample)
head(q2)

ggplot(data=q2, mapping = aes(x=type, y=sample, fill=type))+
  geom_boxplot(fill="white") + 
  geom_dotplot(binaxis='y', stackdir='center') +
  ggtitle("Time taken to fall asleep for smokers vs non-smokers") +
  ylab("time taken to fall asleep (min)") +
  theme(legend.position = "none") +
  scale_y_continuous(breaks = seq(10, 70, by = 5))


ggplot(q2, aes(sample, fill=type))+
  geom_dotplot(binwidth = 4, dotsize = 0.7, stackratio = 1, method = "histodot") +
  ggtitle("Time taken to fall asleep for smokers vs non-smokers (bin = 4)") +
  theme(legend.position = "bottom",
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank()) +
  xlab("time taken to fall asleep (min)") +
  scale_x_continuous(breaks = seq(10, 70, by = 4))

#Question 3
lowVel <- c(72.68,72.62,72.58,72.48,73.07,72.55,72.42,72.84,72.58,72.92)
highVel <- c(71.62,71.68,71.74,71.48,71.55,71.52,71.71,71.56,71.70,71.50)
vel <- c(lowVel,highVel)
velType <- c(rep("low",10),rep("high",10))
q3 <- data.frame(velType,vel)
highLowPlot <- ggplot(q3, mapping=aes(x=velType, y=vel))+
  geom_boxplot() +
  stat_summary(fun=mean, color="red") +
  xlab("Injection Velocity") +
  ylab("Shrinkage value") +
  scale_y_continuous(breaks = seq(71.4,73.2,by=0.2), limits = c(71.4,73.2)) +
  theme(axis.text.y=element_text(size=12.5))

highLowPlot


#Question 4
lowVel <- c(76.20,76.09,75.98,76.15,76.17,75.94,76.12,76.18,76.25,75.82)
highVel <- c(93.25,93.19,92.87,93.29,93.37,92.98,93.47,93.75,93.89,91.62)
vel <- c(lowVel,highVel)
velType <- c(rep("low",10),rep("high",10))
q4 <- data.frame(velType,vel)
head(q4)
highLowPlot <- ggplot(q4, mapping=aes(x=velType, y=vel))+
  geom_boxplot() +
  xlab("Injection Velocity") +
  ylab("Shrinkage value")
highLowPlot

highPlot <- ggplot(filter(q4,velType=="high"), mapping=aes(x=velType, y=vel))+
  geom_boxplot() +
  geom_point(mapping=aes(y=mean(vel)),color="red",size=5) +
  xlab("High Velocity") +
  ylab("Shrinkage value") +
  scale_y_continuous(breaks = seq(92,94,by=0.2), limits = c(92,94)) +
  theme(axis.text.y=element_text(size=15))

lowPlot <- ggplot(filter(q4,velType=="low"), mapping=aes(x=velType, y=vel))+
  geom_boxplot() +
  geom_point(mapping=aes(y=mean(vel)),color="red",size=5) +
  xlab("Low Velocity") +
  ylab("Shrinkage value") +
  scale_y_continuous(breaks = seq(74,78,by=0.2), limits = c(75,77)) +
  theme(axis.text.y=element_text(size=15))

grid.arrange(highPlot,lowPlot,ncol=2)

boxplot.stats(filter(q4,velType=="low")$vel)
boxplot.stats(filter(q4,velType=="high")$vel)
