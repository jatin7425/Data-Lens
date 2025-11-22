from fastapi import FastAPI
from pydantic import BaseModel
from utils.csv_parser import parse_csv

app = FastAPI()

class CsvInput(BaseModel):
    csv: str

@app.post("/parse_csv")
def parse_csv_route(data: CsvInput):
    return parse_csv(data.csv)

@app.get("/")
def health():
    return {"status": "running"}
