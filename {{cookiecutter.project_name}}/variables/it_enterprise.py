import os
from dotenv import load_dotenv


load_dotenv(override=True)

G_IT_LOGIN = os.getenv("IT_LOGIN")
G_IT_PASSWORD = os.getenv("IT_PASSWORD")
