# Introduction

Slack (https://slack.com/) is a popular communication platform that widely used in the industry. Like many other platforms, Slack supports the use of bot to perform different actions, such as sending a message in a channel whenever an event occurs.

This tutorial would like to show how to create and setup a simple bot in Slack with Python.

# Motivation

With the Slack bot, multiple events can be monitored and notified in Slack easily. This helps the development cycle and assist the communication within the project team.

# Intended Learning Outcomes

In this tutorial, you will learn:

How to write and deploy a Slack bot that can 
- Reply to a [@mention](https://slack.com/help/articles/205240127-Use-mentions-in-Slack#mention-someone) message (Event handling)
- Send a message in a channel whenever there is a merge/pull request made in GitHub
- Query the usage of some services, for example, the usage count of AWS services

# Environment

- Python 3.8