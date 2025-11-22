from openai import OpenAI

def generate_summary(stats, api_key):
    client = OpenAI(api_key=api_key)

    prompt = f"""
    Write a short executive summary for this dataset.
    Stats: {stats}
    """

    res = client.responses.create(
        model="gpt-4o",
        input=prompt
    )

    return res.output_text
