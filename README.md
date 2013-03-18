HappyTo: No more "sad bcc"
==============

What's a sad bcc, you ask? It's when you want to send an email a list of
people:

- who you'd prefer not to see each other's email addresses
- who you want to still feel special
- who you want to customize a piece of the email for

So, what does HappyTo do then? I'd be happy to tell you. Basically, all
of those things. Remember the days of mail merge? It's that, but with
Gmail and Google Spreadsheets.

You just:

1. Create a Google Spreadsheet with at least an "email" column. You can
create other columns to customize what will go in the email each person
receives (columns should be lower case).
1. [Publish the spreadsheet](http://support.google.com/drive/bin/answer.py?hl=en&answer=37579)
1. Export your Gmail user name and password locally

        export GMAIL_USERNAME = shaq@gmail.com
        export GMAIL_PASSWORD = kazam
        # feel free to put a space in front of those commands so they don't get stuck in your history
1. Grab and start the app

        git clone https://github.com/nahurst/happy_to.git
        bundle install
        rails s
        http://localhost:3000

1. Enter your spreadsheet url. For example:

        https://docs.google.com/spreadsheet/pub?key=0AuI4VolCrNFLdFJRZXJWbGowNDZVM2NXMm1faGJVd0E&output=html

1. Enter a subject template. You may use any column name as a Mustache template variable. Ex:

        Great to see you yesterday {{name}}

1. Enter a body template. You may use any column name as a Mustache template variable. Ex:

        <p>Hi {{name}},</p>
        <p>I'm happy to tell you I'm using HappyTo to send an email to you at {{email}}.</p>
        <p>It was great to see you in your movie, {{movie}}. Gotta love the 90s!</p>

Kazaam! Your emails are sent.


What's under the hood
-----------------------
HappyTo uses a few different technologies:

- Rails of course
- The extremely helpful [Tabletop](https://github.com/jsoma/tabletop)
- The snazzy [Mustache](http://mustache.github.com/)
- The oft-overlooked [Foundation](http://foundation.zurb.com/)

What's next?
------------------------
- Allow email recipients to click links to answer simple questions like: are you coming to my event?
- As the front end expands, use a single-page framework like
Ember or Backbone instead of the existing lightweight option.
- Include explicit test emails before sending all emails (it's
currently handled by you managing your own spreadsheet).

Why don't you host this for me?
-------------------------------
A few reasons: 

- You don't get between a dog and it's bone, and you don't get between a techie and their Gmail password.
- I don't want to deal with spam-related issues. This is meant for personal use. Use something else to send out your shake weight emails. Gmail will cap you at about 200 bulk emails per day anyway.
