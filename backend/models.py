from flask_sqlalchemy import SQLAlchemy


db = SQLAlchemy()


class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String)


class Donation(db.Model):
    id = db.Column(db.Integer, primary_key=True)

    donor_id = db.Column(db.Integer, db.ForeignKey('user.id', ondelete='CASCADE'), nullable=False)
    donor = db.relationship('User', backref='donations')

    def to_json(self):
        return {
            'id': self.id,
            'donor': self.donor
        }


class FoodItem(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, nullable=True)

    def to_json(self):
        return {
            'id': self.id,
            'name': self.name
        }
