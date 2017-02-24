
# README

# ChoreMate
==========


I created ChoreMate as my "Breakable Toy" final project during my time as an apprentice with Launch Academy. I was inspired to create it by the time I spent serving as an Americorps fellow with Episcopal Service Corps, living in an intentional community, sharing resources with 5 other young people. One challenge we faced was finding a way of sharing chores that was both equitable and amicable. ChoreMate represents my attempt to create an application for people in communal living environments to share chores without an overly top-down delegation strategy.

Features:
------------------
Users of ChoreMate can create chores for their apartment. Chores are assigned a point value, based on the amount of labor entailed, as well as a completion interval, that is used to update the chore with a new due date each time the chore is marked as completed, or "claimed". Chores are sorted and color-coded based on their due-date and user scores are viewable by all, as a public yet impersonal measure of accountability.

Outline of Technologies:
------------------------
- Ruby on Rails (2.3.1)
- AJAX (index page CLAIM and DELETE funcitonality)
- PostgreSQL
- ActiveRecord
- Materialize & CSS
- Capybara
- Factory Girl


To Run Locally:
---------------------
1. Run rake db:migrate to acquire databases.
2. Make sure to bundle to install any Ruby dependencies.
3. Run rails server
