# Reply to a @mention message

This part of the tutorial will show how the bot can send a message only when it is mentioned using @mention feature.

In this part we will use [slack-bolt](https://pypi.org/project/slack-bolt/) instead of [slackeventapi](https://pypi.org/project/slackeventsapi/) as Bolt covers not only Events API but also all the latest Slack Platform features.

1. Install slack-bolt

	`pip install slack-bolt`{{execute}}

2.  Let's begin with a new template
   
    <pre class="file" data-filename="main.py" data-target="replace">
    from slack_sdk import WebClient
    from slack_sdk.errors import SlackApiError

    # TODO-include-library
    
    import os
    from dotenv import load_dotenv

    # Load environment variable(s).
    load_dotenv()
    OAUTH_TOKEN=os.getenv("OAUTH_TOKEN")

    # Create a web client instance.
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
	</pre>

3. 