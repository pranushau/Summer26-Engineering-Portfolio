import re
import numpy as np
from sklearn.tree import DecisionTreeClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score

data = []

with open("sensor_data.txt") as f:
    for line in f:
        m = re.search(r"X:\s*([-0-9.]+),\s*Y:\s*([-0-9.]+),\s*Z:\s*([-0-9.]+)", line)
        if m:
            data.append([float(v) for v in m.groups()])

X = np.array(data)

# Create features from 20-sample windows:
# mean and standard deviation of each acceleration axis.
window = 20
features = []
labels = []

mid = len(X) // 2

for i in range(0, len(X) - window + 1, window):
    chunk = X[i:i+window]

    features.append([
        np.mean(chunk[:,0]), np.std(chunk[:,0]),
        np.mean(chunk[:,1]), np.std(chunk[:,1]),
        np.mean(chunk[:,2]), np.std(chunk[:,2])
    ])

    labels.append(0 if i < mid else 1)

features = np.array(features)
labels = np.array(labels)

X_train, X_test, y_train, y_test = train_test_split(
    features, labels,
    test_size=0.25,
    random_state=42,
    stratify=labels
)

model = DecisionTreeClassifier(max_depth=3, random_state=42)
model.fit(X_train, y_train)

predictions = model.predict(X_test)
accuracy = accuracy_score(y_test, predictions)

print(f"Windows: {len(features)}")
print(f"Training windows: {len(X_train)}")
print(f"Test windows: {len(X_test)}")
print(f"Test accuracy: {accuracy * 100:.1f}%")
print("0 = still, 1 = moving")
