#this is a password generator

import random
from flask import Flask
from flask_restful import Resource, Api

app = Flask(__name__)
api = Api(app)

complexity = 3

class Password(Resource):

    def get(self):
        #This function generate the string with the password

        #We open the local dictionary (on Linux systems)
        word_file = '/usr/share/dict/words'
        words = open(word_file).read().splitlines()

        #We create the container variable to add the words and a count variable for our loop
        password = ""
        count = 0

        #We pick 3 of them and add it to the container
        while count < complexity:
            word = str(random.choice(words))
            word = word.translate(None, "'")
            word = word.title()
            password += word
            if count != complexity-1:
                password += "|"
            count += 1

        return {'The password is ':password}
        #return {'hello': 'world'}

api.add_resource(Password, '/')

if __name__ == '__main__':
    app.run(host='0.0.0.0')
