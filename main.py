import json
import io

fichier = io.open("out.txt", "a", encoding="utf-8")

def process_item(key, value, prefix):
    if isinstance(value, dict):
        for k, v in value.items():
            process_item(k, v, prefix + key + ".")
    else:
        if isinstance(value, bool):
            value = str(value).lower()
        print(f"{prefix}{key}={value}")
        fichier.write(f"{prefix}{key}={value}\n")

def process_json(data):
    for key, value in data.items():
        process_item(key, value, "")
        print("")
        fichier.write("")


def main():
    with open("org.openhab.core.thing.Thing.json", "r", encoding="utf-8") as f:
        json_data = f.read()
        data = json.loads(json_data)
        process_json(data)

main()