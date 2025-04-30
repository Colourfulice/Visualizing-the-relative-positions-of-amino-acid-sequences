# 加载所需的库
library(ggplot2)
library(readr)  # 用于读取CSV文件

# 读取CSV数据
df <- read_csv("C:/Users/Administrator/Desktop/1/fus-position.csv")  # 请替换为你的CSV文件路径

# 绘制图表
p <- ggplot(df, aes(x = Position, y = Letter)) +
  geom_tile(width = 1, height = 0.5, fill = "black") +  # 细长的竖直条形
  theme_minimal() +  # 使用简洁的主题
  labs(x = "Residue Number", y = "Amino Acid") +  # 轴标签
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # 旋转x轴刻度，提高可读性

print(p)

