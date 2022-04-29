**If you see the message "This environment is no longer available." in the terminal, please refresh the page and load the scenario again.**

# Sending a Message via Bot

This part of the tutorial will show how the bot can send a message using [slack-sdk](https://pypi.org/project/slack-sdk/) library.

Please note that we are *NOT* using [slackclient](https://pypi.org/project/slackclient/) in this tutorial as it is announced to be a legacy code.

## Create an App

First go to https://api.slack.com/ to create our first app.

1. Select **"Create an app"** in the front page.
2. Select **"From scratch"**.
3. Give your bot a name and select the workspace you want to setup the bot.
4. Select **"Create app"**.

![Create an app](./assets/step1/create_an_app.jpg)

## Give Permission(s) to the App

Then we have to give the bot some permissions to send messages in our Slack workspace. It is always a good idea to limit the resources that the bot can access. (See [the principle of least privilege](https://en.wikipedia.org/wiki/Principle_of_least_privilege)).

1. Under the *Basic Information* of Settings, select **"Bots"** in the menu of "Add features and functionality".
   
	![Building Apps for Slack](./assets/step1/building_apps_for_slack.jpg)
2. Select **"Review Scopes to Add"**, it will take you to *OAuth & Permissions* to review and add scopes to the app.
3. Under the "Scope" section, select the scope **"chat:write.public"**, it will also select the scope **"chat:write"** automatically.
4. Go to the section *OAuth Tokens for Your Workspace*, select **"Install to Workspace"**.
5. Review the permission and select **"allow"**.
6. After that it will generate a **Bot User OAuth Token** for you, copy it to your clipboard. It should be in the format of "xoxb-xxxxxxxxxxxxxxxxxxxx".
   
   ![Token](./assets/step1/token.jpg)
7. You will then see the app is successfully added to your workspace.
   
   ![Apps in workspace](./assets/step1/apps_in_workspace.jpg)

## Setup Environment Variable(s)

It is a good practice to set the OAuth Token as environment variable instead of purely pasting it in the Python code. See [here](https://api.slack.com/authentication/best-practices) why you should do so.

1. First create a `app` directory for our bot.
   
   `mkdir app; cd app`{{execute}}

2. Create a `.env` file.
   
   `app/.env`{{open}}
3. Replace "xoxb-xxxxxxxxxxxxxxxxxxxx" with your own Bot User OAuth Token.

   <pre class="file" data-filename="app/.env" data-target="replace">
   SLACK_BOT_TOKEN=xoxb-xxxxxxxxxxxxxxxxxxxx
   </pre>

4. To load and use the environment variable in `.env`, we have to use the python-dotenv library.

   `pip install python-dotenv`{{execute}}

   and this is the code for loading and using the environment variable

   `app/main.py`{{open}}

   <pre class="file" data-filename="app/main.py" data-target="replace">
   import os
   from dotenv import load_dotenv

   # Load environment variable(s).
   load_dotenv()
   SLACK_BOT_TOKEN=os.getenv("SLACK_BOT_TOKEN")
   </pre>

## Send a Message to a Channel

1. Install slack-sdk

   `pip install slack-sdk`{{execute}}

   Again, note that we are *NOT* using [slackclient](https://pypi.org/project/slackclient/) in this tutorial as it is announced to be a legacy code.

2. Import the libraries for the web client and catching exception

   <pre class="file" data-filename="main.py" data-target="prepend">
   from slack_sdk import WebClient
   from slack_sdk.errors import SlackApiError
   </pre>

3. Create a web client instance

   <pre class="file" data-filename="main.py" data-target="append">
   # Create a web client instance.
   client = WebClient(token=SLACK_BOT_TOKEN)
   </pre>

4. Create a function for sending message to a specific channel

   This function takes the channel name or channel ID and the message to be sent as the parameter.
   Channel name should be in the format of "#*something*", for example, "#general".
   Channel ID should looks something like "C0XXXXXX", you will learn how to get it in the next step.

   <pre class="file" data-filename="main.py" data-target="append">
   def send_message(channel: str, message: str):
      try:
         response = client.chat_postMessage(
            channel=channel,
            text=message
         )
      except SlackApiError as e:
         # A proper logger shall be used for catching this exception.
         print("Error: " + e.response["error"])
   </pre>

5. Getting the channel ID (optional)
   1. Right click the channel that you want to send a message to.
   2. Select **"Open channel details"**.
   3. Your channel ID is in the bottom of the popup box, it should looks something like "C0XXXXXX".
   4. Copy your channel ID.

6. Send a message

   To send a message, replace "C0XXXXXX" with your channel ID or channel name, for example, "#general".

   <pre class="file" data-filename="main.py" data-target="append">
   if __name__ == "__main__":
      send_message("C0XXXXXX", "Hello world, nice to meet you!")
   </pre>

7. Try execute it

   `python main.py`{{execute}}

   You can now see that the message is sent to the channel.

   ![Message sent](./assets/step1/message_sent_success.jpg)
