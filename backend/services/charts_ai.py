from openai import OpenAI

def generate_charts(schema, sample, api_key):
    client = OpenAI(api_key=api_key)
    prompt = f"""
    Suggest 4–6 useful charts based on this schema and sample data.
    Schema: {schema}
    Sample: {sample}
    Output strictly JSON.
    """

    res = client.responses.create(
        model="gpt-4o-mini",
        input=prompt
    )

    return res.output_text
