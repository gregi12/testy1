from django.test import TestCase
from rest_framework.test import APIClient
from rest_framework import status

class AddNumbers(TestCase):

    def setup(self):
        self.client = APIClient()
    
    def test_true(self)
        num1 = 2 
        num2 = 2
        self.assertEqual(num1,num2)

    def test_false(self)
        num1 = 2 
        num2 = 3
        self.assertEqual(num1,num2)

