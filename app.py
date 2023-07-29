from flask import Flask, request
from flask_restful import Resource, Api

app = Flask(__name__)
api = Api(app)

# Sample data for books (replace this with a database in a real-world scenario)
books = [
    {"id": 1, "title": "Book 1", "author": "Author 1"},
    {"id": 2, "title": "Book 2", "author": "Author 2"},
    # Add more books as needed
]

class BookResource(Resource):
    def get(self, book_id):
        book = next((b for b in books if b["id"] == book_id), None)
        return book if book else {"message": "Book not found"}, 404

    def put(self, book_id):
        book = next((b for b in books if b["id"] == book_id), None)
        if book:
            data = request.get_json()
            book["title"] = data.get("title", book["title"])
            book["author"] = data.get("author", book["author"])
            return book, 200
        else:
            return {"message": "Book not found"}, 404

    def delete(self, book_id):
        global books
        books = [b for b in books if b["id"] != book_id]
        return {"message": "Book deleted successfully"}, 200

class BookListResource(Resource):
    def get(self):
        return books, 200

    def post(self):
        data = request.get_json()
        if not data.get("title") or not data.get("author"):
            return {"message": "Title and Author are required fields"}, 400

        book_id = len(books) + 1
        new_book = {"id": book_id, "title": data["title"], "author": data["author"]}
        books.append(new_book)
        return new_book, 201

api.add_resource(BookListResource, '/')
api.add_resource(BookResource, '/books/<int:book_id>')

if __name__ == '__main__':
    app.run(debug=True)
