import pandas as pd

def translate_column(column_name):
    translations = {
        "Id": "№ загрози",
        "Title": "Назва загрози",
        "Category": "STRIDE-клас загрози",
        "Interaction": "Назва зв`язку",
        "Description": "Опис загрози",
        "Possible Mitigation(s)": "MTMT-рекомендації з усунення загроз",
    }
    return translations.get(column_name, column_name)

def csv_to_md(csv_file, md_file, selected_columns):
    df = pd.read_csv(csv_file)

    translated_columns = [translate_column(col) for col in selected_columns]

    with open(md_file, 'w', encoding='utf-8') as md_file:
        md_file.write("| " + " | ".join(translated_columns) + " |\n")
        md_file.write("|" + ":---:|" * len(translated_columns) + "\n")

        for index, row in df[selected_columns].iterrows():
            md_file.write("| " + " | ".join(map(str, row)) + " |\n")





csv_to_md('report.csv', 'Threat.md', ["Id", "Title", "Category", "Interaction", "Description"])
csv_to_md('report.csv', 'Mitigations.md', ["Id", "Possible Mitigation(s)"])
