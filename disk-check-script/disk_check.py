import subprocess

THRESHOLD = 80

print("Checking filesystem usage...\n")

# run df command
result = subprocess.check_output(["df", "-h"]).decode()

lines = result.split("\n")[1:]  # skip header

for line in lines:
    if line.strip() == "":
        continue

    parts = line.split()

    filesystem = parts[0]
    usage = parts[4].replace("%", "")
    mount = parts[5]

    # skip tmp filesystems
    if "tmp" in filesystem:
        continue

    usage = int(usage)

    if usage > THRESHOLD:
        print(f"ALERT: {mount} is {usage}% full")
    else:
        print(f"{mount} OK: {usage}%")

print("\nDisk check complete.")
