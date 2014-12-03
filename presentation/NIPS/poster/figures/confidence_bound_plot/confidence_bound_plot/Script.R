mu=c(1,1,2 2)

plot(mu)
df=data.frame(arm=c("arm 1","arm 1", "arm 2", "arm 2"), objective_value=mu)
qplot(objective_value, data=df)
