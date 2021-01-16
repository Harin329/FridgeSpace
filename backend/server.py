import os
from flask import Flask, jsonify
from sqlalchemy.orm import sessionmaker
from cockroachdb.sqlalchemy import run_transaction
from models import db, User, Donation, FoodItem

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = os.environ['DATABASE_URL']
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db.init_app(app)

with app.app_context():
    sessionmaker = sessionmaker(db.engine)
    run_transaction(sessionmaker, lambda _: db.create_all())


@app.route('/api/healthcheck')
def healthcheck():
    return jsonify(status='success')


@app.route('/api/donations', methods=['GET'])
def get_donations():
    donations = Donation.query.all()
    return jsonify(
        status='success',
        donations=list(map(Donation.to_json, donations))
    )
