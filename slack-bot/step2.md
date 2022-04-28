# Reply to a @mention message

This part of the tutorial will show how the bot can send a message only when it is mentioned using @mention feature.

In this part we will use [slack-bolt](https://pypi.org/project/slack-bolt/) instead of [slackeventapi](https://pypi.org/project/slackeventsapi/) as Bolt covers not only Events API but also all the latest Slack Platform features.

1. Install slack-bolt

	`pip install slack-bolt`{{execute}}

2.  We can keep most of the code we have just wrote in Step 1
   
    <pre class="file" data-filename="main.py" data-target="replace">
    print("TEST")
	</pre>

3. 