from flask import request, jsonify, abort
from flask_login import current_user, login_user, logout_user, login_required

from models import app, db, login_manager
from models import User, Donation, FoodItem


db.create_all()


@app.route('/')
def hello_world():
    return 'Welcome to FrydgeSpace!'


@app.route('/api/healthcheck')
def healthcheck():
    return jsonify(status='success')


@login_manager.user_loader
def load_user(user_id):
    return User.query.get(user_id)


@app.route('/api/signup', methods=['POST'])
def signup():
    email = request.json.get('email')
    name = request.json.get('name')
    password = request.json.get('password')

    if not email or not password:
        return jsonify(status='failure', message='Missing email or password')

    if User.query.filter_by(email=email).count():
        return jsonify(status='failure', message='User with email already exists')

    user = User(email=email, name=name)
    db.session.add(user)
    db.session.commit()
    login_user(user, remember=True)

    return jsonify(
        status='success',
        user=current_user.to_json()
    )


@app.route('/api/login', methods=['POST'])
def login():
    email = request.json.get('email')
    password = request.json.get('password')

    if not email or not password:
        abort(401)

    user = User.query.filter_by(email=email).first()

    if user is None:
        abort(401)

    login_user(user, remember=True)

    return jsonify(
        status='success',
        user=current_user.to_json()
    )


@app.route('/api/login/facebook', methods=['POST'])
def facebook_login():
    facebook_id = request.json.get('facebookId')
    email = request.json.get('email')
    name = request.json.get('name')

    if not facebook_id or not email or not name:
        return jsonify(status='failure', message='Missing user info')

    user = User.query.filter_by(email=email).first()

    if user is None:
        user = User(email=email, name=name, facebook_id=facebook_id)
        db.session.add(user)
        db.session.commit()

    login_user(user, remember=True)

    return jsonify(
        status='success',
        user=current_user.to_json()
    )


@app.route('/api/logout', methods=['GET'])
@login_required
def logout():
    logout_user()
    return jsonify(status='success')


@app.route('/api/donations', methods=['POST'])
@login_required
def create_donation():
    food_item_ids = request.json.get('foodItems')

    if not food_item_ids:
        return jsonify(status='failure', message='Donation must include food items')

    donation = Donation(
        donor_id=current_user.id,
        food_items=FoodItem.query.filter(FoodItem.id.in_(food_item_ids)).all()
    )

    return jsonify(
        status='success',
        donation=donation
    )


@app.route('/api/donations', methods=['GET'])
@login_required
def get_donations():
    return jsonify(
        status='success',
        donations=list(map(Donation.to_json, current_user.donations))
    )


def generate_mock_data():
    if not User.query.filter_by(email='test@test.com', name='test user', facebook_id='test').first():
        test_user = User(email='test@test.com', name='test user', facebook_id='test')
        db.session.add(test_user)
        db.session.commit()

        food_items = [FoodItem.query.filter_by(name=name).first() or FoodItem(name=name)
                      for name in ('Cabbage', 'Carrot', 'Apple', 'Banana', 'Avocado', 'Mac & Cheese')]
        donation_1 = Donation(
            donor_id=test_user.id,
            food_items=food_items[:4]
        )
        donation_2 = Donation(
            donor_id=test_user.id,
            food_items=food_items[3:]
        )
        db.session.add(donation_1)
        db.session.add(donation_2)
        db.session.commit()


if __name__ == '__main__':
    generate_mock_data()
    app.run()
