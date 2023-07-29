from flask import Flask, request, jsonify

app = Flask(__name__)

# Sample data for demonstration (replace this with your data storage or database)
data = [
    {"id": 1, "name": "Item 1"},
    {"id": 2, "name": "Item 2"},
    {"id": 3, "name": "Item 3"}
]

@app.route('/items', methods=['POST'])
def create_item():
    new_item = {"id": len(data) + 1, "name": request.json['name']}
    data.append(new_item)
    return jsonify(new_item), 201

@app.route('/items', methods=['GET'])
def get_items():
    return jsonify(data), 200

@app.route('/items/<int:item_id>', methods=['GET'])
def get_item(item_id):
    item = next((item for item in data if item['id'] == item_id), None)
    if item:
        return jsonify(item), 200
    return jsonify({"message": "Item not found"}), 404

@app.route('/items/<int:item_id>', methods=['PUT'])
def update_item(item_id):
    item = next((item for item in data if item['id'] == item_id), None)
    if item:
        item['name'] = request.json['name']
        return jsonify(item), 200
    return jsonify({"message": "Item not found"}), 404

@app.route('/items/<int:item_id>', methods=['DELETE'])
def delete_item(item_id):
    global data
    data = [item for item in data if item['id'] != item_id]
    return jsonify({"message": "Item deleted successfully"}), 200

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')