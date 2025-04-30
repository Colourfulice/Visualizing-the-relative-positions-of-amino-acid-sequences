
# 运行流程
docx_path = ""  # 替换为你的 Word 文件路径
csv_path = ""  # 输出的 CSV 文件路径
from docx import Document
import csv
import re
import matplotlib.pyplot as plt
from collections import Counter

# 读取 Word 文档
def extract_text_from_docx(docx_path):
    doc = Document(docx_path)
    text = "\n".join([para.text for para in doc.paragraphs])
    return text

# 提取字母及其位置
def extract_letters_positions(text):
    return [(match.group(), match.start() + 1) for match in re.finditer(r'[A-Za-z]', text)]

# 统计字符数量
def count_letters(letters_positions):
    all_letters = [letter for letter, pos in letters_positions]
    first_300_letters = [letter for letter, pos in letters_positions if pos <= 300]

    total_counts = Counter(all_letters)
    first_300_counts = Counter(first_300_letters)

    return total_counts, first_300_counts

# 导出第一个 CSV（字母及其位置）
def export_positions_csv(letters_positions, csv_path):
    with open(csv_path, mode="w", newline="", encoding="utf-8") as file:
        writer = csv.writer(file)
        writer.writerow(["Letter", "Position"])
        writer.writerows(letters_positions)

# 导出第二个 CSV（字母的统计数据）
def export_counts_csv(total_counts, first_300_counts, csv_path):
    with open(csv_path, mode="w", newline="", encoding="utf-8") as file:
        writer = csv.writer(file)
        writer.writerow(["Letter", "Total_Count", "Count_in_First_300"])
        for letter in sorted(total_counts.keys()):
            writer.writerow([letter, total_counts[letter], first_300_counts.get(letter, 0)])

# 生成柱形图
def plot_bar_chart(total_counts, first_300_counts):
    letters = sorted(total_counts.keys())
    total_values = [total_counts[letter] for letter in letters]
    first_300_values = [first_300_counts.get(letter, 0) for letter in letters]

    x = range(len(letters))

    plt.figure(figsize=(10, 5))
    plt.bar(x, total_values, label="Total Count", alpha=0.7, color="blue")
    plt.bar(x, first_300_values, label="Count in First 300", alpha=0.7, color="red")

    plt.xticks(x, letters)
    plt.xlabel("Letters")
    plt.ylabel("Count")
    plt.title("Letter Frequency Analysis")
    plt.legend()
    plt.show()

# 运行流程
docx_path = "c:\\Users\\Administrator\\Desktop\\1\\fus.docx"  # 你的 Word 文件路径
positions_csv_path = "c:\\Users\\Administrator\\Desktop\\1\\fus-position.csv"  # 字母及位置 CSV
counts_csv_path = "c:\\Users\\Administrator\\Desktop\\1\\fus-number.csv"  # 统计数据 CSV

text = extract_text_from_docx(docx_path)
letters_positions = extract_letters_positions(text)

# 统计字符频率
total_counts, first_300_counts = count_letters(letters_positions)

# 导出 CSV 文件
export_positions_csv(letters_positions, positions_csv_path)
export_counts_csv(total_counts, first_300_counts, counts_csv_path)

# 绘制柱状图
plot_bar_chart(total_counts, first_300_counts)

print(f"字母及位置 CSV 已生成: {positions_csv_path}")
print(f"字母统计 CSV 已生成: {counts_csv_path}")
