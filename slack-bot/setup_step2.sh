cat << EOF > /tmp/main.py
from slack_sdk import WebClient
from slack_sdk.errors import SlackApiError

# TODO-import-library

import os
from dotenv import load_dotenv

load_dotenv()
OAUTH_TOKEN=os.getenv("OAUTH_TOKEN")

client = WebClient(token=OAUTH_TOKEN)

def send_message(channel: str, message: str):
    try:
        response = client.chat_postMessage(
            channel=channel,
            text=message
        )
    except SlackApiError as e:
        # A proper logger shall be used for catching this exception.
        print(e.response["error"])

if __name__ == "__main__":
    # TODO-main-function
EOF
cp /tmp/main.py .