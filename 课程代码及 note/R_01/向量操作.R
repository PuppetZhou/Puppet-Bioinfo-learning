# vector
## 向量生成
c(1,2,3,4,5)
rep("x",times=5)
1:5
seq(from=3,to=21,by=3)
rnorm(n=4)
### combine
paste0(rep("x",times=3),1:3)
c(TRUE,FALSE,4)
### exercise
seq(from=4,to=30,by=4)
paste0(rep("sample",times=7),seq(from=4,to=30,by=4),collapse=",")

## calculate
x<-c(1,2,3,4,5)
x+1
log(x)      
sqrt(x)
x>3
x==3
## 向量操作
length(x)
unique(x)### 去重复
duplicated(x)### 重复统计输出为 TF，第一次出现为F
var(x)
sd(x)
sum(x)
mean(x)
max(x)
min(x)
table(x)###重复统计
sort(x)

### 对两个向量的操作
x=c(1,3,5,1)
y=c(3,2,5,6)
x %in% y### x中元素是否在y 中存在,不论位置
x==y### 一一对应比对
paste(x,y,sep="'")

#### 循环补齐
x=c(1,3,5,6,2)
y=c(3,2,5)
x==y

## 向量筛选
x<- 8:12
x[x<11]
x%in%c(9,13)
x[x%in%c(9,13)]
x[4]
x[c(1,5)]
x[1:5]
x[-4]
x[-(2:4)]

## 向量元素修改
x<-8:12
x[c(1,5)]<-c(20,80)
x
## 向量作图
k1<-rnorm(12)
k1
k2<-rep(c("a","b","c","d"),each=3)
k2
plot(k1)
boxplot(k1~k2)

## 元素顺序调整
x<-c("a","b","c")
x[c(1,3,2)]
scores<-c(100,85,78,130)
sort(scores)
scores[c(3,2,1,4)]

order(scores)
scores[order(scores)]


## 向量匹配
x<-c("a","b","c","d","e")
y<-c("b","c","d","a","e")
match(y,x)
x[match(y,x)]
