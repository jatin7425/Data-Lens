import pandas as pd
from io import StringIO

def parse_csv(csv_text: str):
    df = pd.read_csv(StringIO(csv_text))

    schema = [
        {"name": col, "type": str(df[col].dtype)}
        for col in df.columns
    ]

    sample = df.head(5).to_dict(orient="records")

    stats = df.describe(include='all').to_dict()

    return {
        "schema": schema,
        "sample": sample,
        "stats": stats,
        "totalRows": len(df)
    }
