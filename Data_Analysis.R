#Set Working Directory to Netamorphosis folder to read file.
install.packages("readxl")
library(readxl)
install.packages("plyr")
library(plyr)
install.packages("plotly")
library(plotly)
df <- read_excel("HireArt - Data Analyst Exercise 10.12.17.xlsx
                 ")
#Check type of Data
typeof(df)

#Check any NULL Values
anyNA(df)

#Data Exploration
summary(df) #Identify dimension of data and general summary
summary(unique(df)) # Identify unique elements and length of unique elements

u_am <- unique(df$`Account manager`)
length(u_am) #4 unique account managers

u_cn <-unique(df$`Client Name`)
length(u_cn) #35 unique clients

u_date<-unique(df$`Date of Contact`)
length(u_date) #704 unique dates of contact

#Extremes Identification
count_am<- count(df$`Account manager`) # Milan Crona is the most contacted Account manager
count_cn<- count(df$`Client Name`) # Eichmann and Sons is the most contacted Client Name
count_date<- count(df$`Date of Contact`) # 2013-10-11 is the most contacted Date

#This seems that October is the month when maximum number of clients can be contacted

#Lets dig in the date column
df$`Date of Contact` <- as.Date(df$`Date of Contact`)
df1 <- df
df1 <- data.frame(date = datetxt,
                 year = as.numeric(format(datetxt, format = "%Y")),
                 month = as.numeric(format(datetxt, format = "%m")),
                 day = as.numeric(format(datetxt, format = "%d"))) #Split Date into YEAR, MONTH and DATE Format

#Visualization
count(df1$`Client Name`)
plot1 <- plot_ly(x = df1$month, y = df$`Client Name`, name = "Per Month Analysis",
                 type = "histogram")
plot1 # From Graph it is observed that max clients were contacted in the month of "OCTOBER"