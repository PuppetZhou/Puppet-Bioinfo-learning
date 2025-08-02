#重点：数据框
#1.数据框来源
# （1）在R中新建
# （2）由已有数据转换或处理得到
# （3）从文件中读取
# （4）内置数据集
#2.新建和读取数据框
df <- data.frame(gene    = paste0("gene",1:4),
                 change  = rep(c("up","down"),each = 2),
                 score   = c(5,3,-2,-4))
df

df1<-data.frame(gene=c("g1","g2","g3"),
               sam=c("s1","s2","s3"),
               exp=c(32,34,45))
df1

df2 <- read.csv("gene.csv")
df2

#3.数据框属性
#数据框维度
dim(df)
nrow(df)
ncol(df)
#行列名查看
rownames(df)
colnames(df)

#4.数据框取子集
df$score #删掉score，按tab键试试
mean(df$score)

## 按坐标
df[2,2] #第二行第二列
df[2,] # 一整行
df[,2]
df[2]
df[c(1,3),1:2]# 行列都选，均可以用向量表示
df[c(1,3),c(1,2)] # 中括号里的逗号表示维度分割
## 按名字
df[,"gene"]
df[,c('gene','change')]
## 按条件（逻辑值）
df[df$score>0,]
df[df$score<0,]
## 思考题
nn = c('gene','change')
df[,nn] #利用向量作为中间变量

df[,3]
df[,ncol(df)]# 取df的最后一列
df[,-ncol(df)]# 取df的第一列

#筛选score>0的基因
df$score>0 #输出一个逻辑值，按照逻辑值对应来取子集
df[df$score>0,1]
df[df$score>0,] # 按行取子集，保留所有列，True 留下
df$gene[df$score>0]

#5.数据框编辑

#改一个格
df[3,3]<- 5
df
#改一整列
df$score<-c(12,23,50,2)   #修改一列·  
df$abc <-c(1,2,3,4) #给df新增一列
df
#？
df$p.value <-c(0.01,0.02,0.07,0.05) 
df

#改行名和列名

row.names(df) # 本质上是向量
rownames(df) <- c("r1","r2","r3","r4")
#只修改某一行/列的名
colnames(df)[2]="CHANGE"

#6.数据框进阶

#(1)行数较多的数据框可截取前/后几行查看
iris
head(iris)
head(iris,3)
tail(iris)
#(2)行列数都多的数据框可取前几行前几列查看
iris[1:3,1:3]
#(3) 查看每一列的数据类型和具体内容
str(df)
str(iris)

#(4)去除含有缺失值的行

#生成一个有NA的数据框
df<-data.frame(X1 = LETTERS[1:5],X2 = 1:5)
df[2,2] <- NA
df[4,1] <- NA
df

na.omit(df)

#(5)两个表格的链接
test1 <- data.frame(name = c('jimmy','nicker','Damon','Sophie'), 
                    blood_type = c("A","B","O","AB"))
test1
test2 <- data.frame(name = c('Damon','jimmy','nicker','tony'),
                    group = c("group1","group1","group2","group2"),
                    vision = c(4.2,4.3,4.9,4.5))
test2

test3 <- data.frame(NAME = c('Damon','jimmy','nicker','tony'),
                    weight = c(140,145,110,138))
merge(test1,test2,by="name")
merge(test1,test3,by.x = "name",by.y = "NAME")

#####矩阵和列表
m <- matrix(1:9, nrow = 3)
colnames(m) <- c("a","b","c") #列名
m
m[2,]
m[,1]
m[2,3]
m[2:3,1:2]
m
t(m)
as.data.frame(m)
#列表
l <- list(m=matrix(1:9, nrow = 3),
          df=data.frame(gene  = paste0("gene",1:3),
                        sam   = paste0("sample",1:3),
                        exp   = c(32,34,45)),
          x=c(1,3,5))
l

l[[2]]
l$df

#补充：元素的名字

scores = c(100,59,73,95,45)
names(scores) = c("jimmy","nicker","Damon","Sophie","tony")
scores
scores["jimmy"]
scores[c("jimmy","nicker")]

names(scores)[scores>60]

#删除 
rm(l)
rm(df,m)
rm(list = ls()) 

