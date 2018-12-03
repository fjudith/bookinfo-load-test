import base64

from locust import HttpLocust, TaskSet, task
from random import randint, choice
from io import BytesIO


class WebTasks(TaskSet):

    @task
    def load(self):

        self.client.get("/productpage")


class Web(HttpLocust):
    task_set = WebTasks
    min_wait = 0
    max_wait = 0
