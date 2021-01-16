from flask import jsonify
from models import app, db, User, Donation, FoodItem


db.create_all()


@app.route('/')
def hello_world():
    return 'Welcome to FrydgeSpace!'


@app.route('/api/healthcheck')
def healthcheck():
    return jsonify(status='success')


@app.route('/api/donations', methods=['POST'])
def create_donation():
    food_item_ids = request.json.get('foodItems')

    if not food_item_ids:
        return jsonify(status='failure', message='Donation must include food items')

    donation = Donation(
        donor_id=test_user.id,
        food_items=FoodItem.query.filter(FoodItem.id.in_(food_item_ids)).all()
    )

    return jsonify(
        status='success',
        donation=donation
    )


@app.route('/api/donations', methods=['GET'])
def get_donations():
    donations = Donation.query.all()
    return jsonify(
        status='success',
        donations=list(map(Donation.to_json, donations))
    )


def generate_mock_data():
    test_user = User(name='test user')
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
