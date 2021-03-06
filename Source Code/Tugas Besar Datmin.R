#lokasi file TB
setwd("D:/SEMESTER3/DATMIN/TB")

#pembacaan dataset TB
dataset <-read.csv("dataset.csv", sep = ",")

#install library
#install.packages("C50")
#install.packages("printr")

#load library yang diinstal
library(C50)
library(printr)

dataset$Age <- as.factor(dataset$Age)
dataset$Gender <- as.factor(dataset$Gender)
dataset$TB <- as.factor(dataset$TB)
dataset$DB <- as.factor(dataset$DB)
dataset$alkphos <- as.factor(dataset$alkphos)
dataset$sgpt <- as.factor(dataset$sgpt)
dataset$sgot <- as.factor(dataset$sgot)
dataset$tp <- as.factor(dataset$tp)
dataset$alb <- as.factor(dataset$alb)
dataset$ag <- as.factor(dataset$ag)
dataset$Selector <- as.factor(dataset$Selector)

#Pembuatan model pada TB
model <- C5.0(Selector ~., data=dataset)

#Hasil model pada TB
model
summary(model)

#Menggambar model pada TB
plot(model)

#Membuat objek datatesting dari kolom 1-10 pada dataset
datatesting <- dataset[,1:10]

#Prediksi pada dataset
predictions <-predict(model, datatesting)

#Membandingkan hasil prediksi
table(predictions, dataset$Selector)
