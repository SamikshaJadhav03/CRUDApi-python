from flask import Flask, request, jsonify

app = Flask(__name__)

# Sample data for demonstration (replace this with your data storage or database)
data = [
    {"id": 1, "name": "Sam"},
    {"id": 2, "name": "Tom"},
    {"id": 3, "name": "John"}
]

@app.route('/candidates', methods=['POST'])
def create_candidates():
    new_candidates = {"id": len(data) + 1, "name": request.json['name']}
    data.append(new_candidates)
    return jsonify(new_candidates), 201

@app.route('/candidates', methods=['GET'])
def get_candidates():
    return jsonify(data), 200

@app.route('/candidates/<int:candidates_id>', methods=['GET'])
def get_candidates(candidates_id):
    candidates = next((candidates for candidates in data if candidates['id'] == candidates_id), None)
    if candidates:
        return jsonify(candidates), 200
    return jsonify({"message": "candidates not found"}), 404

@app.route('/candidates/<int:candidates_id>', methods=['PUT'])
def update_candidates(candidates_id):
    candidates = next((candidates for candidates in data if candidates['id'] == candidates_id), None)
    if candidates:
        candidates['name'] = request.json['name']
        return jsonify(candidates), 200
    return jsonify({"message": "candidates not found"}), 404

@app.route('/candidates/<int:candidates_id>', methods=['DELETE'])
def delete_candidates(candidates_id):
    global data
    data = [candidates for candidates in data if candidates['id'] != candidates_id]
    return jsonify({"message": "candidates deleted successfully"}), 200

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')