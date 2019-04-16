from app import app, db
import unittest

DB_URI = 'postgresql://cs162_user:cs162_password@127.0.0.1/cs162?port=5432'

class TestDatabase(unittest.TestCase):
    def setUp(self):
        engine = create_engine(DB_URI)
        self.conn = engine.connect()
    
    def test_add_valid(self):
        response=self.app.post(
            '/add',
            data={"form": {"expression":"1+1"}},
            follow_redirects=True
        )
        self.assertEqual(response.status_code, 200)

    def test_add_invalid(self):
        response=self.app.post(
            '/add',
            data={"form": {"expression":"1+"}},
            follow_redirects=True
        )
        self.assertEqual(response.status_code, 400)

conn = sqlite3.connect('postgresql://cs162_user:cs162_password@db/cs162')
def database_test(self):
    c.execute("Select id, text, value, now from expression where text = '1+1' ")
