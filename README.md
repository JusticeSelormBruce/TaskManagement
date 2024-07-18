# Task Manager Application

## Overview

The Task Manager application is a simple web application built with Laravel. It allows users to manage tasks by creating, editing, deleting, and reordering them through a drag-and-drop interface. Tasks can also be associated with projects, enabling users to view tasks by project.

## Features

- Create tasks with a name and priority.
- Edit existing tasks.
- Delete tasks.
- Reorder tasks using drag-and-drop, with priorities updated automatically.
- Associate tasks with projects.
- View tasks filtered by projects.

## Requirements

- PHP >= 8.0
- Composer
- MySQL

## Setup Instructions

### 1. Clone the Repository

cd task-manager

### Install Dependencies
- composer install

### Set Up Environment Variables
 - cp .env.example .env

 ### Edit the .env file to set your database configuration
    DB_CONNECTION=mysql
    DB_HOST=127.0.0.1
    DB_PORT=3306
    DB_DATABASE=task_manager
    DB_USERNAME=root
    DB_PASSWORD=


 ### Generate Application Key
  - php artisan key:generate

### Run Migrations
- php artisan migrate

###  Run seed
    - php artisan db:seed


 ### Serve the Application
 - php artisan serve
