from robot.api.deco import keyword
from pymongo import MongoClient
import bcrypt
import os

client = MongoClient(os.environ['CONNECT_MONGODB'])

db = client['markdb']

# Apaga usuario e as task relacionadas a ele
@keyword('Limpa usuario DB')
def clean_user(user_email):
    users = db['users']
    tasks = db['tasks']

    user = users.find_one({'email': user_email})

    if (user):
        tasks.delete_many({'user': user['_id']})
        users.delete_many({'email': user_email})
        
# Apaga usuario
@keyword('Remove usuario DB')
def remove_user(email):
    users = db['users']

    users.delete_many({'email':email})
    # print('removing user by ' + email)


# Insere usuario
@keyword('Inserir usuario DB')
def insert_user(user):

    hash_pass = bcrypt.hashpw(user['password'].encode('utf-8'), bcrypt.gensalt(8))

    doc = {
        'name': user['name'],
        'email': user['email'],
        'password': hash_pass
    }

    users = db['users']
    users.insert_one(doc)
    # print('insert user')
    # print(user)