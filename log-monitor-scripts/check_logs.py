import sys

logfile = sys.argv[1]

keywords = ["ERROR", "FATAL", "Exception"]
count = 0

with open(logfile, "r", errors="ignore") as f:
    for line in f:
        if any(word in line for word in keywords):
            print(line.strip())
            count += 1

print("\nTotal matches:", count)
