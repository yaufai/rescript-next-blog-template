---
slug : analytics
title: Analytics
description: "How to enable Google Analytics"
tags:
    - customization
date : 2023-04-08
---

# Overview

[Google Analytics](https://analytics.google.com) is a powerful tool to analyze visitors' behavior. We use [nextjs-google-analytics](https://github.com/MauricioRobayo/nextjs-google-analytics) to install Google Analytics to the template.

# Steps to Enable Google Analytics

1. Get a measurement ID for Google Analytics
    - Visit [[GA4] Find your Google tag ID](https://support.google.com/analytics/answer/9539598?hl=en)
1. Place the measurement ID in your cloud
    - [nextjs-google-analytics](https://github.com/MauricioRobayo/nextjs-google-analytics) can load the ID from environmental variables. Please follow [usage section](https://github.com/MauricioRobayo/nextjs-google-analytics#usage) of the repository README.
1. Enable Google Analytics in this template
    - `pages/_app.res` has a necessary code to enable Google Analytics in the comment. Please make it live as below.
1. Include needed contents by Google Analytics
    - for example [privacy policy](https://support.google.com/analytics/answer/7318509?hl=en) is necessary

Needed Change in `pages/_app.res`:

```diff
- // <GoogleAnalytics trackPageViews=true />
+ <GoogleAnalytics trackPageViews=true />
```